import 'dart:io';
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/views/home/note_model/note_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  Rx<DateTime> date = DateTime.now().obs;
  Rx<File?> imageFile = Rx<File?>(null);

  void incrementMonth() {
    date.value =
        DateTime(date.value.year, date.value.month + 1, date.value.day);
  }

  void decrementMonth() {
    date.value =
        DateTime(date.value.year, date.value.month - 1, date.value.day);
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<String?> saveImageToStorage(File imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final localPath = appDir.path;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      final localFile = File('$localPath/$fileName');
      await imageFile.copy(localFile.path);

      print('Image saved to: ${localFile.path}');
      return localFile.path;
    } catch (error) {
      print('Error saving image: $error');
      return null;
    }
  }

  RxString title = ''.obs;
  RxString description = ''.obs;

  void setTitle(String newTitle) {
    title.value = newTitle;
  }

  void setDescription(String newDescription) {
    description.value = newDescription;
  }

  void reset() {
    title.value = '';
    description.value = '';
    date.value = DateTime.now();
    imageFile.value = null;
  }

  Future<void> saveJournalEntry() async {
    // Save the image to storage and get the path
    String? imagePath;
    if (imageFile.value != null) {
      imagePath = await saveImageToStorage(imageFile.value!);
    }

    // Create the Note instance with the imagePath
    Note newNote = Note(
        id: "",
        title: title.value,
        description: description.value,
        imagePath: imagePath);

    // Send data to the API
    await sendDataToApi(newNote);

    // The rest of your code remains unchanged
    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList('journal_entries') ?? [];

    // Add the newNote as a string
    entries.add(json.encode(newNote.toMap()));
    prefs.setStringList('journal_entries', entries);

    // Add the newNote to the notes list in HomeController
    Get.put(HomeController()).addNote(newNote);
    reset();
  }

  Future<void> sendDataToApi(Note newNote) async {
    final url = Uri.parse(ApiConstant.journal);
    final header = await ApiHeaderConstant.headerWithToken();

    final jsonData = {
      "title": newNote.title,
      "sub_title": "",
      "content": newNote.description,
      "image": newNote.imagePath,
      "mood": ""
    };

    try {
      final response = await http.post(
        url,
        headers: header,
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        print('Data sent to API successfully');
      } else {
        print('Failed to send data to API: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error sending data to API: $error');
    }
  }
}

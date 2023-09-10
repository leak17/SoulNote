import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_controller.dart';
import 'dart:convert';

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

  Future<void> saveImageToStorage(File imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final localPath = appDir.path;
      const fileName = '';

      final localFile = File('$localPath/$fileName');
      await imageFile.copy(localFile.path);

      print('Image saved to: ${localFile.path}');
    } catch (error) {
      print('Error saving image: $error');
    }
  }

  // note new properties
  RxString title = ''.obs;
  RxString description = ''.obs;

  void setTitle(String newTitle) {
    title.value = newTitle;
  }

  void setDescription(String newDescription) {
    description.value = newDescription;
  }

  Future<void> saveJournalEntry() async {
    // Create the Note instance
    Note newNote = Note(title: title.value, description: description.value);

    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList('journal_entries') ?? [];

    // Add the newNote as a string
    entries.add(json.encode(newNote.toMap()));
    prefs.setStringList('journal_entries', entries);

    // Add the newNote to the notes list in HomeController
    Get.find<HomeController>().addNote(newNote);
  }
}

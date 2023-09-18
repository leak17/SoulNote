import 'dart:convert';
import 'dart:io';
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/views/home/note_model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diary_journal/views/home/home_controller.dart';
import 'package:http/http.dart' as http;

import '../../create/local_widget/mood.dart';

class DetailsController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Rx<File?> imageFile = Rx<File?>(null);
  Rx<DateTime> date = DateTime.now().obs;
  Rx<Mood?> selectedMood = Rx<Mood?>(null);

  int noteIndex;
  File? initialImageFile;

  DetailsController({
    required this.noteIndex,
    required this.initialImageFile, // Pass the initial image file here
  });

  @override
  void onInit() {
    super.onInit();
    final homeController = Get.find<HomeController>();
    final note = homeController.notes[noteIndex];
    title.text = note.title;
    description.text = note.description;

    // Set the initial image file if available
    imageFile.value = initialImageFile;
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    super.onClose();
  }

  void setTitle(String newTitle) {
    title.text = newTitle;
  }

  void setDescription(String newDescription) {
    description.text = newDescription;
  }

  void setSelectedMood(Mood? mood) {
    selectedMood.value = mood;
  }

  void incrementDay() {
    date.value =
        DateTime(date.value.year, date.value.month, date.value.day + 1);
  }

  void decrementDay() {
    date.value =
        DateTime(date.value.year, date.value.month, date.value.day - 1);
  }

  Future<void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> saveJournalEntry() async {
    String? imagePath;
    if (imageFile.value != null) {
      imagePath = await saveImageToStorage(imageFile.value!);
    }

    final prefs = await SharedPreferences.getInstance();
    final List<String> entries = prefs.getStringList('journal_entries') ?? [];

    if (noteIndex >= 0 && noteIndex < entries.length) {
      Note newNote = Note(
        id: "",
        title: title.text,
        subTitle: "",
        description: description.text,
        imagePath: imagePath,
        mood: '',
        imageProvider: imagePath != null && imagePath.isNotEmpty
            ? FileImage(File(imagePath))
            : const AssetImage('assets/images/default_image.jpg')
                as ImageProvider<Object>?,
      );

      entries[noteIndex] = json.encode(newNote.toMap());

      prefs.setStringList('journal_entries', entries);

      final homeController = Get.find<HomeController>();
      homeController.updateNoteContent(noteIndex, newNote.title,
          newNote.description, newNote.mood.toString());
      await updateNoteOnApi(newNote);

      Get.find<HomeController>().updateNoteImage(noteIndex, imagePath);
    }
  }

  Future<String> saveImageToStorage(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'image_${DateTime.now()}.png';
    final savedImage = await image.copy('${appDir.path}/$fileName');
    return savedImage.path;
  }

  Future<void> updateNoteOnApi(Note note) async {
    final url = Uri.parse(ApiConstant.journal);

    final header = await ApiHeaderConstant.headerWithToken();

    final jsonData = {
      "id": "",
      "title": note.title,
      "sub_title": "",
      "content": note.description,
      "image": note.imagePath,
      "mood": ""
    };

    try {
      final response = await http.put(
        Uri.parse('$url/notes/${note.id}'),
        headers: header,
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        print('Note updated successfully on the API');
      } else {
        print('Failed to update note on the API');
      }
    } catch (e) {
      print('Error updating note on the API: $e');
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diary_journal/views/home/home_controller.dart';

class DetailsController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Rx<File?> imageFile = Rx<File?>(null);

  int noteIndex;

  DetailsController({required this.noteIndex});

  @override
  void onInit() {
    super.onInit();
    final homeController = Get.find<HomeController>();
    final note = homeController.notes[noteIndex];
    title.text = note.title;
    description.text = note.description;
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
        title: title.text,
        description: description.text,
        imagePath: imagePath,
        imageProvider: imagePath != null && imagePath.isNotEmpty
            ? FileImage(File(imagePath))
            : const AssetImage('assets/images/default_image.jpg')
                as ImageProvider<Object>?,
      );

      entries[noteIndex] = json.encode(newNote.toMap());

      prefs.setStringList('journal_entries', entries);

      final homeController = Get.find<HomeController>();
      homeController.updateNoteContent(
          noteIndex, newNote.title, newNote.description);
    }
  }

  Future<String> saveImageToStorage(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'image_${DateTime.now()}.png';
    final savedImage = await image.copy('${appDir.path}/$fileName');
    return savedImage.path;
  }
}

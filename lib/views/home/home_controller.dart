import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Note {
  final String title;
  final String description;
  final String? imagePath;
  final ImageProvider? imageProvider;

  Note(
      {required this.title,
      required this.description,
      this.imagePath,
      this.imageProvider});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'imagePath': imagePath};
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      description: map['description'],
      imagePath: map['imagePath'],
    );
  }
}

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  void deleteJournalEntry(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      // You may want to save the updated notes list to persistent storage here
    }
  }

  // Notes
  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  void addNote(Note note) {
    notes.add(note);
    saveNotes();
  }

  void createNote(String title, String description, [String? imagePath]) {
    Note note = Note(
      title: title,
      description: description,
      imagePath: imagePath,
    );
    addNote(note);
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedNotes = prefs.getStringList('journal_entries');
    if (savedNotes != null) {
      notes.value =
          savedNotes.map((e) => Note.fromMap(json.decode(e))).toList();
    }
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringNotes =
        notes.map((e) => json.encode(e.toMap())).toList();
    prefs.setStringList('journal_entries', stringNotes);
  }

  void fetchNotes() {
    loadNotes();
  }

  Future<void> updateNoteContent(
      int index, String newTitle, String newDescription) async {
    if (index >= 0 && index < notes.length) {
      notes[index] = Note(
        title: newTitle,
        description: newDescription,
        imagePath: notes[index].imagePath,
      );
      saveNotes();
    }
  }
}

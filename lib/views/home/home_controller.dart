import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Note {
  final String title;
  final String description;
  final String? imagePath;

  Note({required this.title, required this.description, this.imagePath});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'imagePath': imagePath};
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
        title: map['title'],
        description: map['description'],
        imagePath: map['imagePath']);
  }
}

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  // note

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
    Note note =
        Note(title: title, description: description, imagePath: imagePath);
    addNote(note);
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedNotes = prefs
        .getStringList('journal_entries'); // Ensure you use 'journal_entries'
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
}

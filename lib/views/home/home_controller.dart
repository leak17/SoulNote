import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/views/home/note_model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> fetchDataFromApi() async {
    final url = Uri.parse(ApiConstant.journal);
    final header = await ApiHeaderConstant.headerWithToken();
    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        for (final item in data) {
          final note = Note.fromMap(item);
          notes.add(note);
        }
      } else {
        print('Failed to load data from API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

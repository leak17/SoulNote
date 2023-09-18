import 'dart:convert';
import 'package:diary_journal/theme/theme_color.dart';
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

  void deleteJournalEntry(int index) async {
    if (index >= 0 && index < notes.length) {
      final deletedNote = notes.removeAt(index);

      // Send a DELETE request to the API to delete the journal entry by 'id'.
      final response = await deleteJournalEntryOnApi(deletedNote.id);

      if (response.statusCode == 200) {
        print('Journal entry deleted from API successfully.');
      } else {
        print(
            'Failed to delete journal entry from API: ${response.statusCode}');
        // Re-add the entry if the API request fails to maintain consistency.
        notes.insert(index, deletedNote);
      }

      // Save the updated notes list to persistent storage here if needed.
      saveNotes();
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

  void createNote(String title, String description, String mood,
      [String? imagePath]) {
    Note note = Note(
      id: "",
      title: title,
      subTitle: "",
      description: description,
      imagePath: imagePath,
      mood: mood,
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
      int index, String newTitle, String newDescription, String newMood) async {
    if (index >= 0 && index < notes.length) {
      notes[index] = Note(
        id: "",
        title: newTitle,
        subTitle: "",
        description: newDescription,
        imagePath: notes[index].imagePath,
        mood: newMood,
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

  Future<http.Response> deleteJournalEntryOnApi(String id) async {
    final url = Uri.parse('${ApiConstant.journal}/$id');
    final header = await ApiHeaderConstant.headerWithToken();

    try {
      final response = await http.delete(
        url,
        headers: header,
      );
      return response;
    } catch (error) {
      print('Error deleting journal entry from API: $error');
      throw error;
    }
  }

  final Map<String, Color> moodIconBackgroundColors = {
    'assets/images/Awsome.png': ThemeColor.successColor,
    'assets/images/Happy.png': ThemeColor.happyColor,
    'assets/images/Neutral.png': ThemeColor.nautralColor,
    'assets/images/Bad.png': ThemeColor.badColor,
    'assets/images/Awful.png': ThemeColor.awfulColor,
  };
}

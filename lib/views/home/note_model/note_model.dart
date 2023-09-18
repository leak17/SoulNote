import 'package:flutter/material.dart';

class Note {
  final String title;
  final String description;
  final String? subTitle;
  final String? imagePath;
  final ImageProvider? imageProvider;
  final String? mood;

  Note({
    required this.title,
    this.subTitle,
    required this.description,
    this.imagePath,
    this.imageProvider,
    this.mood,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sub_title': subTitle,
      'content': description,
      'image': imagePath,
      'mood': mood
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
        title: map['title'],
        subTitle: map['sub_title'],
        description: map['content'],
        imagePath: map['image'],
        mood: map['mood']);
  }
}

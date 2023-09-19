import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final String? subTitle;
  final String? imagePath;
  final ImageProvider? imageProvider;
  final String? mood;

  Note({
    required this.id,
    required this.title,
    this.subTitle,
    required this.description,
    this.imagePath,
    this.imageProvider,
    this.mood,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include 'id' in the map
      'title': title,
      'sub_title': subTitle,
      'content': description,
      'image': imagePath,
      'mood': mood,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      subTitle: map['sub_title'],
      description: map['content'],
      imagePath: map['image'],
      mood: map['mood'],
    );
  }

  Note copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? description,
    String? imagePath,
    String? mood,
    ImageProvider<Object>? imageProvider,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      mood: mood ?? this.mood,
      imageProvider: imageProvider ?? this.imageProvider,
    );
  }
}

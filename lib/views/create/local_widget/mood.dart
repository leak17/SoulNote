import 'package:flutter/material.dart';

class Mood {
  final String iconPath;
  final String name;
  final ColorFilter? colorFilter;
  final double size;
  Color color;

  Mood({
    required this.iconPath,
    required this.name,
    this.colorFilter,
    required this.size,
    required this.color,
  });
}

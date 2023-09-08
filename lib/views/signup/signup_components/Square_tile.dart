import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColor.colorScheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(100),
        color: ThemeColor.colorScheme.onSurface,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}

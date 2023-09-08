import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.firstIcon,
    required this.secondIcon,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onTap;
  final IconData firstIcon;
  final IconData secondIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(
            firstIcon,
            color: ThemeColor.colorScheme.onSurface,
          ),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              color: ThemeColor.colorScheme.onSurface,
            ),
          ),
          trailing: Icon(
            secondIcon,
            color: ThemeColor.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';

class Signupbutton extends StatelessWidget {
  final Function()? onTap;

  const Signupbutton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 310,
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: ThemeColor.mainColor,
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              color: ThemeColor.colorScheme.onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

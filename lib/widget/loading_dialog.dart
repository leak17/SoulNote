import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingDialog {
  static showLoaderDialog(BuildContext context, String title) {
    AlertDialog alert = AlertDialog(
      insetPadding: const EdgeInsets.all(96),
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: ThemeColor.colorScheme.primary,
      content: SizedBox(
        height: 88,
        child: Column(
          children: [
            LoadingAnimationWidget.hexagonDots(
              color: ThemeColor.mainColor,
              size: 48,
            ),
            Container(
                margin: const EdgeInsets.only(left: 16, top: 12),
                child: Text(title,
                    style: GoogleFonts.openSans(
                        color: ThemeColor.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600))),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

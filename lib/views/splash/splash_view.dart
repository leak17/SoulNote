import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/start/start_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSplashScreen(
          splash: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 2.0),
                Text(
                  'Soul Note',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: ThemeColor.mainColor,
                    fontFamily: 'KantumruyPro',
                  ),
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0),
                  child: Text(
                    'Your Digital DiaryNote, Your \nTrusted Best Friend!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColor.mainColor,
                      fontFamily: 'KantumruyPro',
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          splashIconSize: 300,
          duration: 8000,
          nextScreen: StartView(),
          nextRoute: Paths.START,
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/images/Rectangle.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }
}

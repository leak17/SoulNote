import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/views/start/start_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSplashScreen(
          splash: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 2.0),
                Text(
                  'Soul Note',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: 'Kantumruy'),
                ),
                SizedBox(height: 4.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 56.0),
                  child: Text(
                    'Your Digital DiaryNote, Your Trusted Best Friend!',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: 'Kantumruy'),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          splashIconSize: 300,
          duration: 10000,
          nextScreen: const StartView(),
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

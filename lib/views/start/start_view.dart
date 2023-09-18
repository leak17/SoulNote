import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'start_controller.dart'; // Import your StartController

class StartView extends StatelessWidget {
  final StartController startController = Get.put(StartController());

  StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorScheme.onSurface,
      body: Center(
        child: GetBuilder<StartController>(
          builder: (_) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 450,
                        width: 220,
                        child: ImageSlideshow(
                          width: 200,
                          height: 290,
                          initialPage: 0,
                          autoPlayInterval: 3000,
                          isLoop: true,
                          children: [
                            Image.asset(
                              'assets/images/home.jpg',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/mood.jpg',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/create.jpg',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/create_mood.jpg',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.cover,
                            ),
                          ],
                        )),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enjoy Your Mood \nNotice",
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'KantumruyPro',
                              color: ThemeColor.mainColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Your Digital DiaryNOTE, Your Trusted Best Friend.\nDigital Notebook where user can write down their thoughts and feelings daily. Calculating a user's mood analysis based on their daily note mood",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'KantumruyPro',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ThemeColor.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 310,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.SIGN_IN);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ThemeColor.mainColor),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: 'KantumruyPro',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ThemeColor.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      width: 310,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.SIGN_UP);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ThemeColor.colorScheme.onSecondary),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'KantumruyPro',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ThemeColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

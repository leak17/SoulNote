import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ThemeColor.mainColor,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
            ),
            Text(
              profileController.userName.value,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'KantumruyPro',
                color: ThemeColor.colorScheme.onSurface,
              ),
            ),
            Obx(() {
              if (profileController.image.value != null) {
                return CircleAvatar(
                  backgroundImage: FileImage(profileController.image.value!),
                  radius: 20,
                );
              } else {
                return CircleAvatar(
                  backgroundImage:
                      NetworkImage(profileController.profileImageUrl.value),
                  radius: 20,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

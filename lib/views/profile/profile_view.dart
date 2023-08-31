import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 143, 170),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: const Color(0xFF213A5C),
              child: Column(
                children: [
                  Text(
                    'Your Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider('${profileController.profileImageUrl.value}?timestamp=${DateTime.now().millisecondsSinceEpoch}'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sak Lysem',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'UI/UX Designer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF213A5C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => Text(
                      profileController.aboutMeText.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    )),
                    const Spacer(),
                    buildButton('Edit Profile', const Color(0xFF213A5C), () {
                      editProfile(context);
                    }),
                    const SizedBox(height: 10),
                    buildButton('Language', const Color(0xFF213A5C), () {
                      _showLanguageModal(context);
                    }),
                    const SizedBox(height: 10),
                    buildButton('Logout', const Color(0xFF213A5C), () {
                      _showLogoutConfirmation(context);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editProfile(BuildContext context) async {
    final newImage = await profileController.pickImage();

    if (newImage != null) {
      final newText = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          String updatedText = profileController.aboutMeText.value;
          TextEditingController textController = TextEditingController(text: updatedText);
          return AlertDialog(
            title: Text('Edit About Me'),
            content: TextField(
              controller: textController,
              onChanged: (newText) {
                updatedText = newText;
              },
              decoration: InputDecoration(labelText: 'About Me'),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, updatedText);
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );

      if (newText != null) {
        profileController.updateProfile(newImage: newImage, newText: newText);
      } else {
        profileController.updateProfile(newImage: newImage);
      }
    }
  }

  void _showLanguageModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              buildLanguageOption('Khmer', Icons.flag, context),
              const SizedBox(height: 10),
              buildLanguageOption('English', Icons.flag, context),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout action here
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, Routes.SIGN_IN);
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildLanguageOption(
      String language, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle language selection here
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes the position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF213A5C), // Icon color
            ),
            SizedBox(width: 10),
            Text(
              language,
              style: TextStyle(
                fontSize: 18,
                color: const Color(0xFF213A5C), // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileView(),
  ));
}

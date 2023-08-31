import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:diary_journal/widget/Term&Condition.dart';
import 'package:diary_journal/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  final ProfileController profileController = Get.put(ProfileController());
  bool showTermsAndConditions = false;

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
                  const Text(
                    'Your Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _showImagePickerDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Obx(() {
                              if (profileController.image.value != null) {
                                return CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      FileImage(profileController.image.value!),
                                );
                              } else {
                                return CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      profileController.profileImageUrl.value),
                                );
                              }
                            }),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 86, 143, 170),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profileController.userName.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileController.userRole.value,
                    style: const TextStyle(
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
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        )),
                    const Spacer(),
                    CustomButton(
                      text: 'Term & Condition',
                      color: const Color(0xFF213A5C),
                      onTap: () {
                        _showTermsAndConditions(context);
                      },
                      firstIcon: Icons.description,
                      secondIcon: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(height: 10),
                    if (showTermsAndConditions)
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Your terms and conditions text goes here.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Language',
                      color: const Color(0xFF213A5C),
                      onTap: () {
                        _showLanguageModal(context);
                      },
                      firstIcon: Icons.language,
                      secondIcon: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Logout',
                      color: const Color(0xFF213A5C),
                      onTap: () {
                        _showLogoutConfirmation(context);
                      },
                      firstIcon: Icons.logout,
                      secondIcon: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    final imageFile = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Image Source",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF213A5C),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ButtonTheme(
                  minWidth: double.infinity, // Set the width of both buttons
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop(profileController.takePhoto());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          Icons.camera_alt,
                          size: 24,
                          color: Color.fromARGB(255, 86, 143, 170),
                        ),
                        SizedBox(
                            width:
                                12), // Adjusted spacing between icon and text
                        Text(
                          "Take a picture",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 86, 143, 170),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Add space between buttons
                ButtonTheme(
                  minWidth: double.infinity, // Set the width of both buttons
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context)
                          .pop(profileController.pickImageFromGallery());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          Icons.photo,
                          size: 24,
                          color: Color.fromARGB(255, 86, 143, 170),
                        ),
                        SizedBox(
                            width:
                                12), // Adjusted spacing between icon and text
                        Text(
                          "Choose from gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 86, 143, 170),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (imageFile != null) {
      profileController.saveImageToStorage(imageFile);
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
          title: const Text(
            'Confirm Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF213A5C),
            ),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color.fromARGB(255, 86, 143, 170),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform logout action here
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, Routes.SIGN_IN);
              },
              child: const Text(
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

  void _showTermsAndConditions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              TermsAndConditionsPage()), // Replace with your actual page
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes the position of shadow
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
            const SizedBox(width: 10),
            Text(
              language,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF213A5C), // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

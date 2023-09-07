import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:diary_journal/widget/Term&Condition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 86, 143,
                                      170), // Customize the icon background color
                                ),
                                child: Icon(
                                  Icons.edit, // Customize the edit icon
                                  color:
                                      Colors.white, // Customize the icon color
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
                    buildButton(
                      'Term & Condition',
                      const Color(0xFF213A5C),
                      Icons.description,
                      Icons.arrow_forward_ios,
                      () {
                        _showTermsAndConditions(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    if (showTermsAndConditions)
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Your terms and conditions text goes here.',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    const SizedBox(height: 10),
                    buildButton(
                      'Language',
                      const Color(0xFF213A5C),
                      Icons.language,
                      Icons.arrow_forward_ios,
                      () {
                        _showLanguageModal(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    buildButton(
                      'Logout',
                      const Color(0xFF213A5C),
                      Icons.logout,
                      Icons.arrow_forward_ios,
                      () {
                        _showLogoutConfirmation(context);
                      },
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
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          Icons.camera_alt,
                          size: 24,
                          color: const Color.fromARGB(255, 86, 143, 170),
                        ),
                        SizedBox(
                            width:
                                12), // Adjusted spacing between icon and text
                        Text(
                          "Take a picture",
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 86, 143, 170),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16), // Add space between buttons
                ButtonTheme(
                  minWidth: double.infinity, // Set the width of both buttons
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context)
                          .pop(profileController.pickImageFromGallery());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          Icons.photo,
                          size: 24,
                          color: const Color.fromARGB(255, 86, 143, 170),
                        ),
                        SizedBox(
                            width:
                                12), // Adjusted spacing between icon and text
                        Text(
                          "Choose from gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 86, 143, 170),
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
          title: Text(
            'Confirm Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF213A5C),
            ),
          ),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: const Color.fromARGB(255, 86, 143, 170),
                ),
              ),
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

  Widget buildButton(
    String text,
    Color color,
    IconData iconData,
    IconData rightIconData, // New parameter for the right icon
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(width: 10), // Add space between left icon and text
            Expanded(
              child: Align(
                alignment: Alignment.center, // Center-align the text
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              rightIconData,
              color: Colors.white,
            ), // Right icon
          ],
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

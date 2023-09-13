import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:diary_journal/widget/Term&Condition.dart';
import 'package:diary_journal/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.blueColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            Expanded(
              child: _buildProfileDetails(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      color: ThemeColor.mainColor,
      child: Column(
        children: [
          Text(
            'Your Profile',
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeColor.colorScheme.onSurface,
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
                          backgroundColor: ThemeColor.colorScheme.onSurface,
                          backgroundImage:
                              FileImage(profileController.image.value!),
                        );
                      } else {
                        return CircleAvatar(
                          radius: 60,
                          backgroundColor: ThemeColor.colorScheme.onSurface,
                          backgroundImage: NetworkImage(
                            profileController.profileImageUrl.value,
                          ),
                        );
                      }
                    }),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColor.blueColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: ThemeColor.colorScheme.onSurface,
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
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ThemeColor.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColor.colorScheme.onSurface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAboutMeSection(context),
            const SizedBox(height: 56),
            _buildCustomButtons(context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutMeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About Me',
              style: TextStyle(
                fontFamily: 'KantumruyPro',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.mainColor,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: ThemeColor.blueColor,
              ),
              onPressed: () {
                _editAboutMe(context);
              },
            ),
          ],
        ),
        const Divider(),
        const SizedBox(height: 8),
        Obx(
          () => Text(
            profileController.aboutMeText.value,
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              fontSize: 16,
              color: ThemeColor.colorScheme.surface,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomButtons(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Term & Condition',
          color: ThemeColor.mainColor,
          onTap: () => _showTermsAndConditions(context),
          firstIcon: Icons.description,
          secondIcon: Icons.arrow_forward_ios,
        ),
        const SizedBox(height: 8),
        CustomButton(
          text: 'Language',
          color: ThemeColor.mainColor,
          onTap: () => _showLanguageModal(context),
          firstIcon: Icons.language,
          secondIcon: Icons.arrow_forward_ios,
        ),
        const SizedBox(height: 8),
        CustomButton(
          text: 'Logout',
          color: ThemeColor.mainColor,
          onTap: () => _showLogoutConfirmation(context),
          firstIcon: Icons.logout,
          secondIcon: Icons.arrow_forward_ios,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void _editAboutMe(BuildContext context) {
    final TextEditingController aboutMeController =
        TextEditingController(text: profileController.aboutMeText.value);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Edit About Me',
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ThemeColor.mainColor,
            ),
          ),
          content: SizedBox(
            width: 300, // Adjust the width as needed
            child: TextField(
              controller: aboutMeController,
              maxLines: 5, // Adjust the number of lines as needed
              decoration: const InputDecoration(
                hintText: 'Enter your new about me text',
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'KantumruyPro',
                  color: ThemeColor.mainColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final updatedAboutMe = aboutMeController.text;
                profileController.saveAboutMeToDataSource(updatedAboutMe);
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'KantumruyPro',
                  color: ThemeColor.colorScheme.onError,
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
        builder: (context) => const TermsAndConditionsPage(),
      ),
    );
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
              fontFamily: 'KantumruyPro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ThemeColor.mainColor,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'KantumruyPro',
              color: ThemeColor.mainColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'KantumruyPro',
                  color: ThemeColor.mainColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, Routes.SIGN_IN);
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'KantumruyPro',
                  color: ThemeColor.colorScheme.onError,
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
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: ThemeColor.colorScheme.onSurface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ThemeColor.colorScheme.secondary,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ThemeColor.mainColor,
            ),
            const SizedBox(width: 10),
            Text(
              language,
              style: TextStyle(
                fontFamily: 'KantumruyPro',
                fontSize: 18,
                color: ThemeColor.mainColor,
                fontWeight: FontWeight.bold,
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
          title: Text(
            "Select Image Source",
            style: TextStyle(
              fontFamily: 'KantumruyPro',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ThemeColor.mainColor,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ButtonTheme(
                  minWidth: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop(profileController.takePhoto());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor.colorScheme.onSurface,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: ThemeColor.blueColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Take a picture",
                          style: TextStyle(
                            fontFamily: 'KantumruyPro',
                            fontSize: 14,
                            color: ThemeColor.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context)
                          .pop(profileController.pickImageFromGallery());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor.colorScheme.onSurface,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Icon(
                          Icons.photo,
                          size: 20,
                          color: ThemeColor.blueColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Choose from gallery",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.blueColor,
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
}

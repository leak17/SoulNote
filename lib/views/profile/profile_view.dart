import 'package:diary_journal/views/profile/profile_controller.dart';
import 'package:diary_journal/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    child: Obx(() {
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
                      text: 'Edit Profile',
                      color: Colors.blue, // Customize the button color
                      onTap: () {},
                      firstIcon: Icons.edit,
                      secondIcon: Icons.arrow_forward,
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
          title: const Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Take a picture"),
                  onTap: () async {
                    Navigator.of(context).pop(profileController.takePhoto());
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: const Text("Choose from gallery"),
                  onTap: () async {
                    Navigator.of(context)
                        .pop(profileController.pickImageFromGallery());
                  },
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

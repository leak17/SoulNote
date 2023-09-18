import 'dart:convert';
import 'dart:io';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:http/http.dart' as http;
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  RxString profileImageUrl = RxString(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9qMp3RM66v5flm1qdQm-xI8qajl0USrQT2A&usqp=CAU');
  RxString userName = RxString("Admin");
  RxString email = RxString("admin99@gmail.com");

  RxString aboutMeText = RxString(
      'Passionate UI/UX designer with a focus on creating user-centered and visually appealing interfaces. Over 5 years of experience working on a variety of projects, from mobile apps to web platforms.');

  Rx<File?> image = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> saveImageToStorage(File imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final localPath = appDir.path;
      const fileName = 'my_image.png';

      final localFile = File('$localPath/$fileName');
      await imageFile.copy(localFile.path);

      print('Image saved to: ${localFile.path}');
    } catch (error) {
      print('Error saving image: $error');
    }
  }

  void saveAboutMeToDataSource(String updatedAboutMe) {
    aboutMeText.value = updatedAboutMe;
  }

  Future<void> fetchDataFromApi() async {
    final url = Uri.parse(ApiConstant.profile);
    final header = await ApiHeaderConstant.headerWithToken();

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final newUserName = responseData['username'];
        final newEmail = responseData['email'];
        userName.value = newUserName;
        email.value = newEmail;
        print('API Response: $responseData');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  // }

  // Future<void> updateProfile(String displayName, String photoUrl) async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     await user.updateDisplayName(displayName);
  //     await user.updatePhotoURL(photoUrl);
  //     await user.reload();
  //     user.reload();
  //   }
  // }

  // Future<void> saveProfileData(String displayName, String photoUrl) async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     await _firestore.collection('users').doc(user.uid).set({
  //       'displayName': displayName,
  //       'photoUrl': photoUrl,
  //     });
  //   }
  // }
}

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxString profileImageUrl = RxString(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9qMp3RM66v5flm1qdQm-xI8qajl0USrQT2A&usqp=CAU');
  RxString aboutMeText = RxString(
      'Passionate UI/UX designer with a focus on creating user-centered and visually appealing interfaces. Over 5 years of experience working on a variety of projects, from mobile apps to web platforms.');

  Future<String?> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedImage?.path;
  }

  void updateProfile({String? newImage, String? newText}) {
    if (newImage != null) {
      profileImageUrl.value = newImage;
    }
    if (newText != null) {
      aboutMeText.value = newText;
    }
    update();
  }
}

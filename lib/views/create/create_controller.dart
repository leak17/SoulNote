import 'dart:io';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CreateController extends GetxController {
  Rx<DateTime> date = DateTime.now().obs;
  Rx<File?> imageFile = Rx<File?>(null);

  void incrementMonth() {
    date.value =
        DateTime(date.value.year, date.value.month + 1, date.value.day);
  }

  void decrementMonth() {
    date.value =
        DateTime(date.value.year, date.value.month - 1, date.value.day);
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> saveImageToStorage(File imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final localPath = appDir.path;
      const fileName = '';

      final localFile = File('$localPath/$fileName');
      await imageFile.copy(localFile.path);

      print('Image saved to: ${localFile.path}');
    } catch (error) {
      print('Error saving image: $error');
    }
  }
}

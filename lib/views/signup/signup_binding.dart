// import 'package:diary_journal/views/signup/signup_controller.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}

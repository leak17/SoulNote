// import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  void signUserUp() {
    // Implement your sign-in logic here
  }

  @override
  void dispose() {
    textController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

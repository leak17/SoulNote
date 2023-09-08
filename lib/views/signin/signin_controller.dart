import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isProcessing = false.obs;
  final RxBool obscureText = true.obs;

  Future<void> signUserIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Both email and password are required',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return;
    }

    isProcessing.value = true;

    final Map<String, dynamic> requestBody = {
      'username': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('https://soulnote-production.up.railway.app'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String accessToken = responseData['access_token'];
      GetStorage().write('access_token', accessToken);

      Get.offNamed(Routes.TAB_BAR_WRAPPER);
    } else {
      Get.snackbar(
        'Error',
        'Sign-in failed. Please check your credentials.',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
    }

    isProcessing.value = false;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

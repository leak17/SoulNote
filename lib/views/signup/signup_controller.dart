import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final RxBool obscureText = true.obs;

  // Add an RxBool to track sign-up processing state
  final RxBool isProcessing = false.obs;

  Future<void> signUserUp() async {
    // Set isProcessing to true to show the loading animation
    isProcessing.value = true;

    final String username = textController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text;
    final String confirmPassword = confirmController.text;

    // Add email validation using a regular expression.
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );

    // Add validation logic here to ensure all fields are filled correctly.
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      isProcessing.value = false; // Set isProcessing back to false
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      isProcessing.value = false; // Set isProcessing back to false
      return;
    }

    // Check if the password and confirm password match.
    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Password and Confirm Password do not match',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      isProcessing.value = false; // Set isProcessing back to false
      return;
    }

    // Perform the sign-up HTTP request.
    final url = Uri.parse('http://localhost:3000/auth/signup');
    final body = jsonEncode({
      'username': username,
      'password': password,
      'email': email,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 201) {
        // Successful sign-up
        Get.snackbar(
          'Success',
          'Sign-up successful',
          backgroundColor: ThemeColor.successColor,
          colorText: ThemeColor.colorScheme.onSurface,
        );

        // Parse the access_token from the response JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String accessToken = responseData['access_token'];

        // Store the access_token in GetStorage
        GetStorage().write('access_token', accessToken);

        // Clear all input fields
        textController.clear();
        emailController.clear();
        passwordController.clear();
        confirmController.clear();

        // Set isProcessing back to false
        isProcessing.value = false;

        // Successful sign-up.
        Get.offNamed(Routes.TAB_BAR_WRAPPER);
      } else {
        // Sign-up failed, display an error message.
        Get.snackbar(
          'Error',
          'Sign-up failed. Please try again later.',
          backgroundColor: ThemeColor.colorScheme.error,
          colorText: ThemeColor.colorScheme.onSurface,
        );
        isProcessing.value = false; // Set isProcessing back to false
      }
    } catch (e) {
      // Handle any exceptions here
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      isProcessing.value = false; // Set isProcessing back to false
    }
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  @override
  void dispose() {
    textController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}

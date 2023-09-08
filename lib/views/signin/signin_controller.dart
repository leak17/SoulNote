import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isProcessing = false.obs; // Observable for loading state

  Future<void> signUserIn() async {
    // Implement your sign-in logic here
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    // Add validation logic here to ensure email and password are filled correctly.
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Both email and password are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Show loading animation while processing
    isProcessing.value = true;

    // Create the request body as a Map
    final Map<String, dynamic> requestBody = {
      'username': email,
      'password': password,
    };

    // Send the POST request to the authentication endpoint
    final response = await http.post(
      Uri.parse('http://localhost:3000/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Parse and store the access_token from the response (if available)
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String accessToken = responseData['access_token'];
      GetStorage().write('access_token', accessToken);

      // Successful sign-in, navigate to home screen
      Get.offNamed(Routes.TAB_BAR_WRAPPER);
    } else {
      // Sign-in failed, display an error message.
      Get.snackbar(
        'Error',
        'Sign-in failed. Please check your credentials.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    // Hide loading animation after processing
    isProcessing.value = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

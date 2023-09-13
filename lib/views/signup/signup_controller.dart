import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final RxBool obscureText = true.obs;
  final RxBool confirmPassToggle = true.obs;
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );
  // Add an RxBool to track sign-up processing state
  final RxBool isProcessingLoading = false.obs;

  Future<void> userSignUp(BuildContext context) async {
    // Set isProcessing to true to show the loading animation
    isProcessingLoading.value = true;
    var connectivityResult = await (Connectivity().checkConnectivity());

    final String username = userNameController.text.trim();
    final String email = emailController.text;
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmController.text;

    // Add email validation using a regular expression.

    // Check if any field is empty
    if (isEmptyField(username, 'Username') ||
        isEmptyField(email, 'Email') ||
        isEmptyField(password, 'Password') ||
        isEmptyField(confirmPassword, 'Confirm password')) {
      isProcessingLoading.value = false;
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters long',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return;
    }

    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar(
        'Error',
        'No internet connection. Please check your network settings',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return;
    }
    // Check if the email is valid
    if (!isValidEmail(email)) {
      isProcessingLoading.value = false;
      return;
    }

    // Check if password and confirm password match
    if (!doPasswordsMatch(password, confirmPassword)) {
      isProcessingLoading.value = false;
      dispose();
      return;
    }

    // If all validations pass, proceed with sign-up logic here.
    try {
      final response =
          await performSignUp(username, email, password, confirmPassword);

      if (response.statusCode == 201) {
        handleSuccessfulSignUp(response);
      } else {
        handleFailedSignUp();
      }
    } catch (e) {
      print(e);
      handleException();
    }
  }

  bool isEmptyField(String fieldValue, String fieldName) {
    if (fieldValue.isEmpty) {
      Get.snackbar(
        'Error',
        '$fieldName is required',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return true;
    }
    return false;
  }

  bool isValidEmail(String email) {
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return false;
    }
    return true;
  }

  bool doPasswordsMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Password and Confirm Password do not match',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
      return false;
    }
    return true;
  }

  Future<http.Response> performSignUp(String username, String email,
      String password, String confirmPassword) async {
    Map<String, String> header = ApiHeaderConstant.headerWithoutToken;
    var body = {
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    var url = Uri.parse(ApiConstant.signup);
    print(body);
    return await http.post(
      url,
      headers: header,
      body: json.encode(body),
    );
  }

  void handleSuccessfulSignUp(http.Response response) {
    Get.snackbar(
      'Success',
      'Sign-up successful',
      backgroundColor: ThemeColor.successColor,
      colorText: ThemeColor.colorScheme.onSurface,
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final String accessToken = responseData['access_token'];

    GetStorage().write('access_token', accessToken);

    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmController.clear();

    isProcessingLoading.value = false;

    Get.offNamed(Routes.TAB_BAR_WRAPPER);
  }

  void handleFailedSignUp() {
    Get.snackbar(
      'Error',
      'Sign-up failed. Please try again later.',
      backgroundColor: ThemeColor.colorScheme.error,
      colorText: ThemeColor.colorScheme.onSurface,
    );

    isProcessingLoading.value = false;
  }

  void handleException() {
    Get.snackbar(
      'Error',
      'An error occurred. Please try again later.',
      backgroundColor: ThemeColor.colorScheme.error,
      colorText: ThemeColor.colorScheme.onSurface,
    );

    isProcessingLoading.value = false;
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPassToggle.value = !confirmPassToggle.value;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void setLoadingStateForDuration(Duration duration) {
    isProcessingLoading.value = true;
    Timer(duration, () {
      isProcessingLoading.value = false;
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}

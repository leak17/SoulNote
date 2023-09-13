import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_web_auth/flutter_web_auth.dart';

class SignInController extends GetxController {
  final TextEditingController emailOrUsernameController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isProcessingLoading = false.obs;
  final RxBool obscureText = true.obs;

  Future<void> userSignIn(BuildContext context) async {
    final String emailOrUsername = emailOrUsernameController.text.trim();
    final String password = passwordController.text.trim();

    final connectivityResult = await Connectivity().checkConnectivity();

    isProcessingLoading.value = true;
    const header = ApiHeaderConstant.headerWithoutToken;
    final body = {
      "username": emailOrUsername,
      "password": password,
    };
    final url = Uri.parse(ApiConstant.login);

    if (emailOrUsername.isEmpty || password.isEmpty) {
      _showErrorSnackbar(
          'Error', 'Both email/username and password are required');
      return;
    }

    if (password.length < 6) {
      _showErrorSnackbar(
          'Error', 'Password must be at least 6 characters long');
      return;
    }

    if (connectivityResult == ConnectivityResult.none) {
      _showErrorSnackbar('Error',
          'No internet connection. Please check your network settings');
      return;
    }

    try {
      final response =
          await http.post(url, headers: header, body: json.encode(body));
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        handleSuccessfulSignIn();
      } else {
        _showErrorSnackbar(
            'Error', 'Sign-in failed. Please check your credentials.');
      }
    } catch (e) {
      Get.back();
      print(e);
      _showErrorSnackbar(
          'Error', 'Sign-in failed. An error occurred, please try again.');
    }

    isProcessingLoading.value = false;
  }

  void handleSuccessfulSignIn() {
    _showSuccessSnackbar('Success', 'Sign-in successful');
    emailOrUsernameController.clear();
    passwordController.clear();
    isProcessingLoading.value = false;
    Get.offNamed(Routes.TAB_BAR_WRAPPER);
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> initiateOAuth(String provider) async {
    const baseUrl = ApiConstant.baseUrl;

    try {
      final result = await FlutterWebAuth.authenticate(
        url: '$baseUrl/auth/$provider/login',
        callbackUrlScheme: 'com.example.soulnote',
      );

      final uri = Uri.parse(result);

      if (uri.queryParameters.containsKey('access_token')) {
        final accessToken = uri.queryParameters['access_token'];
        GetStorage().write('access_token', accessToken);
        Get.offNamed(Routes.TAB_BAR_WRAPPER);
      }
    } catch (e) {
      _showErrorSnackbar('Error', 'Sign-in failed. Please try again later.');
    }
  }

  void setLoadingStateForDuration(Duration duration) {
    isProcessingLoading.value = true;
    Timer(duration, () {
      isProcessingLoading.value = false;
    });
  }

  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: ThemeColor.colorScheme.error,
      colorText: ThemeColor.colorScheme.onSurface,
    );
  }

  void _showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: ThemeColor.successColor,
      colorText: ThemeColor.colorScheme.onSurface,
    );
  }

  @override
  void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

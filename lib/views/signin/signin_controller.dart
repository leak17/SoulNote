import 'package:connectivity/connectivity.dart';
import 'package:diary_journal/core/api/constants/api_constant.dart';
import 'package:diary_journal/core/api/constants/api_header_constant.dart';
import 'package:diary_journal/core/api/utils/save_local_data.dart';
import 'package:diary_journal/core/model/login_response.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isProcessingLoading = false.obs;
  final RxBool obscureText = true.obs; // Observable for password visibility

  Future<void> userSignIn(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    var connectivityResult = await (Connectivity().checkConnectivity());

    isProcessingLoading.value = true;
    Map<String, String> header = ApiHeaderConstant.headerWithoutToken;
    var body = {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
    };
    // LoadingDialog.showLoaderDialog(context, "Loading ...");
    var url = Uri.parse(ApiConstant.login);

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Both email and password are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    bool isEmailValid(String email) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      return emailRegex.hasMatch(email);
    }

    // Inside your userSignIn method:
    if (!isEmailValid(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        backgroundColor: ThemeColor.colorScheme.error,
        colorText: ThemeColor.colorScheme.onSurface,
      );
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

    try {
      var response =
          await http.post(url, headers: header, body: json.encode(body));
      print(response.body);
      var data = LoginResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        if (data != null && data.data != null) {
          // Check if data and data.data are not null
          print(data.data!.token.toString());
          await SaveLocalData.setToken(data.data!.token.toString());
          await SaveLocalData.setIsLogin(true);
          await SaveLocalData.setUserId(data.data!.userid!.toInt());
          handleSuccessfulSignUp(data);
        } else {
          Get.snackbar(
            'Error',
            'Invalid response data',
            backgroundColor: ThemeColor.colorScheme.error,
            colorText: ThemeColor.colorScheme.onSurface,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Sign-in failed. Please check your credentials.',
          backgroundColor: ThemeColor.colorScheme.error,
          colorText: ThemeColor.colorScheme.onSurface,
        );
      }
    } catch (e) {
      Get.back();
      print(e);
    }

    isProcessingLoading.value = false;
  }

  void handleSuccessfulSignUp(LoginResponse data) {
    Get.snackbar(
      'Success',
      'Sign-up successful',
      backgroundColor: ThemeColor.successColor,
      colorText: ThemeColor.colorScheme.onSurface,
    );

    final String accessToken = data.data!.token.toString();

    SaveLocalData.setToken(accessToken);
    emailController.clear();
    passwordController.clear();
    isProcessingLoading.value = false;

    Get.offNamed(Routes.TAB_BAR_WRAPPER);
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

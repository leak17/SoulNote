import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/widget/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import 'package:diary_journal/views/signup/signup_components/signup_button.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});

  final SignUpController textSignUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorScheme.onSurface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ThemeColor.colorScheme.onSurface,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/diary_logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'KantumruyPro',
                    color: ThemeColor.mainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      InputTextField(
                        controller: controller.textController,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ThemeColor.mainColor,
                            ),
                          ),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ThemeColor.mainColor),
                          ),
                          fillColor: ThemeColor.colorScheme.onSurface,
                          filled: true,
                          hintStyle: TextStyle(
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.colorScheme.primary,
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InputTextField(
                        controller: controller.emailController,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ThemeColor.mainColor,
                            ),
                          ),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ThemeColor.mainColor),
                          ),
                          fillColor: ThemeColor.colorScheme.onSurface,
                          filled: true,
                          hintStyle: TextStyle(
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.colorScheme.primary,
                          ),
                          prefixIcon: const Icon(Icons.mail),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InputTextField(
                        controller: controller.passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Your Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ThemeColor.mainColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              textSignUpController.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ThemeColor.mainColor,
                            ),
                            onPressed: () {
                              textSignUpController.toggleObscureText();
                            },
                          ),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ThemeColor.mainColor),
                          ),
                          fillColor: ThemeColor.colorScheme.onSurface,
                          filled: true,
                          hintStyle: TextStyle(
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.colorScheme.primary,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InputTextField(
                        controller: controller.confirmController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ThemeColor.mainColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              textSignUpController.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ThemeColor.mainColor,
                            ),
                            onPressed: () {
                              textSignUpController.toggleObscureText();
                            },
                          ),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ThemeColor.mainColor),
                          ),
                          fillColor: ThemeColor.colorScheme.onSurface,
                          filled: true,
                          hintStyle: TextStyle(
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.colorScheme.primary,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Checkbox(
                        value: true,
                        onChanged: null,
                      ),
                      Text(
                        "I'm not a robot!",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.mainColor),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () {
                    if (controller.isProcessing.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return Signupbutton(
                        onTap: controller.signUserUp,
                      );
                    }
                  },
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: ThemeColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

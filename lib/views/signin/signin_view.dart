import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/views/signin/signin_components/Square_tile.dart';
import 'package:diary_journal/widget/Textfield.dart';
import 'package:diary_journal/views/signin/signin_components/signin_button.dart';
import 'package:diary_journal/views/signin/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);
  final SignInController textsignInController = Get.put(SignInController());

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
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'KantumruyPro',
                    color: ThemeColor.mainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputTextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Your Email',
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
                        obscureText: textsignInController.obscureText.value,
                      ),
                      const SizedBox(height: 24),
                      InputTextField(
                        controller: controller.passwordController,
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
                              textsignInController.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ThemeColor.mainColor,
                            ),
                            onPressed: () {
                              textsignInController.toggleObscureText();
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
                        obscureText: textsignInController.obscureText.value,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontFamily: 'KantumruyPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColor.mainColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Forgot Password!',
                            style: TextStyle(
                              fontFamily: 'KantumruyPro',
                              color: ThemeColor.mainColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Signinbutton(
                  // onTap: controller.signUserIn,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.TAB_BAR_WRAPPER);
                  },
                ),
                // Obx(
                //   () => controller.isProcessing.value
                //       ? const CircularProgressIndicator()
                //       : Signinbutton(
                //           onTap: controller.signUserIn,
                //         ),
                // ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: TextStyle(
                            fontFamily: 'KantumruyPro',
                            color: ThemeColor.mainColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: ThemeColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/images/google.png'),
                    SquareTile(imagePath: 'assets/images/apple.png'),
                    SquareTile(imagePath: 'assets/images/facebook.png'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need an account?',
                      style: TextStyle(
                        fontFamily: 'KantumruyPro',
                        color: ThemeColor.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'KantumruyPro',
                              decoration: TextDecoration.underline,
                              color: ThemeColor.blueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

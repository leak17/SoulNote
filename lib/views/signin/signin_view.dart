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
                      buildInputTextField(
                        controller: controller.emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.mail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      buildPasswordTextField(
                        controller: controller,
                        hintText: 'Your Password',
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input your password';
                          }
                          return null;
                        },
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
                Obx(
                  () => controller.isProcessingLoading.value
                      ? const CircularProgressIndicator()
                      : Signinbutton(
                          onTap: () => controller.userSignIn(context),
                        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.initiateOAuth('google');
                      },
                      child: SquareTile(imagePath: 'assets/images/google.png'),
                    ),
                    InkWell(
                      onTap: () {
                        controller.initiateOAuth('facebook');
                      },
                      child:
                          SquareTile(imagePath: 'assets/images/facebook.png'),
                    ),
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

  Widget buildInputTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required TextInputType keyboardType,
    required FormFieldValidator<String>? validator,
  }) {
    return InputTextField(
      controller: controller,
      obscureText: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
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
        prefixIcon: Icon(prefixIcon),
      ),
      validator: validator,
    );
  }

  Widget buildPasswordTextField({
    required SignInController controller,
    String? hintText,
    IconData? prefixIcon,
    String? Function(String?)? validator,
  }) {
    return Obx(
      () {
        final bool obscureText = controller.obscureText.value;

        return InputTextField(
          controller: controller.passwordController,
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: hintText ?? 'Your Password',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ThemeColor.mainColor),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: ThemeColor.mainColor,
              ),
              onPressed: () => controller.toggleObscureText(),
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
            prefixIcon: Icon(prefixIcon ?? Icons.lock),
          ),
          validator: validator,
        );
      },
    );
  }
}

import 'package:diary_journal/theme/theme_color.dart';
import 'package:diary_journal/widget/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import 'package:diary_journal/views/signup/signup_components/signup_button.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

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
                      buildInputTextField(
                        controller: controller.userNameController,
                        hintText: 'Your Name',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
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
                      const SizedBox(height: 15),
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
                      const SizedBox(height: 15),
                      buildConfirmPasswordTextField(
                        controller: controller,
                        hintText: 'Confirm Password',
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input your confirm password';
                          }
                          return null;
                        },
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
                          color: ThemeColor.mainColor,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () {
                    if (controller.isProcessingLoading.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return Signupbutton(
                        onTap: () => controller.userSignUp(context),
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
    required SignUpController controller,
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
              onPressed: () => controller.togglePasswordVisibility(),
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

  Widget buildConfirmPasswordTextField({
    required SignUpController controller,
    String? hintText,
    IconData? prefixIcon,
    String? Function(String?)? validator,
  }) {
    return Obx(
      () {
        final bool obscureText = controller.confirmPassToggle.value;

        return InputTextField(
          controller: controller.confirmController,
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: hintText ?? 'Confirm Password',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ThemeColor.mainColor),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: ThemeColor.mainColor,
              ),
              onPressed: () => controller.toggleConfirmPasswordVisibility(),
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

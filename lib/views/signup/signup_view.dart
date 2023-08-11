// import 'package:diary_journal/views/signup/signup_components/Square_tile.dart';
import 'package:diary_journal/views/signup/signup_components/Textfield.dart';
import 'package:diary_journal/views/signup/signup_components/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDE1E0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(15), // Adding rounded corners
                    color: Colors.white, // Add a background color if necessary
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15), // Applying border radius to the image
                    child: Image.asset(
                      'assets/images/diary_logo.png', // Replace with your logo image path
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF213A5C), // Set the color using Color class
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: controller.textController,
                  hintText: 'Your Name',
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: controller.emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: controller.passwordController,
                  hintText: 'Your Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: controller.confirmController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Align children vertically
                    children: [
                      Checkbox(
                        value: false, // Set the initial value as needed
                        onChanged:
                            null, // No callback attached, checkbox is not interactive
                      ),
                      Text(
                        "I'm not a robot!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(33, 58, 92, 0.6),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ), // Add space to separate Remember Me and Forgot Password
                      // Text(
                      //   'Forgot Password!',
                      //   style: TextStyle(
                      //     color: Color(0xFF213A5C),
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Signupbutton(
                  onTap: controller.signUserUp,
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff213A5C),
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

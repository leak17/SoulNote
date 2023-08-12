import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/signin/signin_components/Square_tile.dart';
import 'package:diary_journal/views/signin/signin_components/Textfield.dart';
import 'package:diary_journal/views/signin/signin_components/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

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
                const SizedBox(height: 70),
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
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xFF213A5C), // Set the color using Color class
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: controller.emailController,
                  hintText: 'Your Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.passwordController,
                  hintText: 'Your Password',
                  obscureText: true,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false, // Set the initial value as needed
                        onChanged: null, // No callback attached, checkbox is not interactive
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(33, 58, 92, 0.6),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ), // Add space to separate Remember Me and Forgot Password
                      Text(
                        'Forgot Password!',
                        style: TextStyle(
                          color: Color(0xFF213A5C),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Signinbutton(
                  // onTap: controller.signUserIn,
                  onTap: (){
                    Navigator.pushNamed(context, Routes.TAB_BAR_WRAPPER);
                  },
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: TextStyle(color: Color(0xff213A5C)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff213A5C),
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
                    SizedBox(
                      width: 40,
                    ),
                    SquareTile(imagePath: 'assets/images/facebook.png'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Need an account?',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 58, 92, 0.4),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.SIGN_UP);
                          },
                          child: const Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
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

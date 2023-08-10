import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon prefixIcon = obscureText ? Icon(Icons.lock) : Icon(Icons.mail);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Add border radius here
            borderSide: const BorderSide(
              color: Color(0xFF213A5C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Add border radius here
            borderSide: const BorderSide(color: Color(0xFF213A5C)),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}

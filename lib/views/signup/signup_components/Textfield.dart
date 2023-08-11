import 'package:flutter/material.dart';

// import 'package:table_calendar/table_calendar.dart';

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
    Icon prefixIcon;

    if (hintText == 'Email') {
      prefixIcon = const Icon(Icons.mail);
    } else if (hintText == 'Your Password') {
      prefixIcon = const Icon(Icons.lock);
    } else if (hintText == 'Your Name'){
      prefixIcon = const Icon(Icons.person);
    }else {
      prefixIcon = const Icon(Icons.lock);
    }

    return SizedBox(
      width: 290, // Set the desired width
      height: 50, // Set the desired height
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0.0), // Adjust horizontal padding as needed
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
      ),
    );
  }
}
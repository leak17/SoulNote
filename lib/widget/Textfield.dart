import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  InputTextField({
    required this.controller,
    this.obscureText = false,
    required this.keyboardType,
    required this.decoration,
    this.validator,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: decoration,
      validator: validator,
    );
  }
}

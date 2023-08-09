import 'package:flutter/material.dart';

class Signinbutton extends StatelessWidget {
  final Function()? onTap;

  const Signinbutton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 290,
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: const BoxDecoration(
          color: Color(0xFF213A5C),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
        )
      ),
    );
  }

}

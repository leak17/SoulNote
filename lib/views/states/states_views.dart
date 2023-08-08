import 'package:flutter/material.dart';

class StatesView extends StatelessWidget{
  const StatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "States",
          style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
        )
      ),
    );
  }

}

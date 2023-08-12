import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ShareView extends StatelessWidget {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Share'),
          )
        ],
      ),
    );
  }
}

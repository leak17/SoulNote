import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class StartController extends GetxController {
  final pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

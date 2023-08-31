import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }
}

import 'package:diary_journal/core/configs/tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TabBarWrapperController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void switchIndex(int index) {
    if (index == selectedIndex.abs()) {
      NavigatorState? currentState =
          TabBarConfig.navigationKeyAt(index).currentState;
      currentState?.popUntil((route) => route.isFirst);
    } else {
      selectedIndex.value = index;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

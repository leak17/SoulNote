import 'package:diary_journal/views/tab_bar_wrapper/tab_bar_wrapper_controller.dart';
import 'package:get/get.dart';

class TabBarWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarWrapperController>(
      () => TabBarWrapperController(),
    );
  }
}

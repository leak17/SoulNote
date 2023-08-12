import 'package:diary_journal/views/start/start_controller.dart';
import 'package:get/get.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartController());
  }
}

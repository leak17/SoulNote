
import 'package:diary_journal/views/share/share_controller.dart';
import 'package:get/get.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}

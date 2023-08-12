import 'package:diary_journal/views/create/create_controller.dart';
import 'package:get/get.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}

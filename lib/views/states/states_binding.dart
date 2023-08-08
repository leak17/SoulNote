import 'package:diary_journal/views/states/states_controller.dart';
import 'package:get/get.dart';

class StatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatesController>(
      () => StatesController(),
    );
  }
}

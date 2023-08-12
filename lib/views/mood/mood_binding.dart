import 'package:diary_journal/views/mood/mood_controller.dart';
import 'package:get/get.dart';

class MoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoodController());
  }
}

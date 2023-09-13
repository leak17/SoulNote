import 'package:diary_journal/views/home/details_screen/details_controller.dart';
import 'package:get/get.dart';

class detailBinding extends Bindings {
  final int noteIndex = 0;
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(noteIndex: noteIndex));

  }
}

import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/views/tab_bar_wrapper/tab_bar_wrapper_binding.dart';
import 'package:diary_journal/views/tab_bar_wrapper/tab_bar_wrapper_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: Paths.TAB_BAR_WRAPPER,
      page: () => const TabBarWrapperView(),
      binding: TabBarWrapperBinding()
    ),
  ];
}

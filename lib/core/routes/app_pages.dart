import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/views/home/home_binding.dart';
import 'package:diary_journal/views/home/home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
        name: Paths.HOME, page: () => const HomeView(), binding: HomeBinding()),
  ];
}

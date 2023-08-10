import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/views/home/home_binding.dart';
import 'package:diary_journal/views/home/home_view.dart';
import 'package:diary_journal/views/signin/signin_binding.dart';
import 'package:diary_journal/views/signin/signin_view.dart';
import 'package:diary_journal/views/signup/signup_binding.dart';
import 'package:diary_journal/views/signup/signup_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    )
  ];
}

import 'package:diary_journal/core/routes/app_paths.dart';
import 'package:diary_journal/views/create/create_binding.dart';
import 'package:diary_journal/views/create/create_view.dart';
import 'package:diary_journal/views/home/home_binding.dart';
import 'package:diary_journal/views/home/home_view.dart';
import 'package:diary_journal/views/mood/mood_binding.dart';
import 'package:diary_journal/views/mood/mood_view.dart';
import 'package:diary_journal/views/profile/profile_binding.dart';
import 'package:diary_journal/views/profile/profile_view.dart';
import 'package:diary_journal/views/share/share_binding.dart';
import 'package:diary_journal/views/share/share_view.dart';
import 'package:diary_journal/views/signin/signin_binding.dart';
import 'package:diary_journal/views/signin/signin_view.dart';
import 'package:diary_journal/views/signup/signup_binding.dart';
import 'package:diary_journal/views/signup/signup_view.dart';
import 'package:diary_journal/views/splash/splash_binding.dart';
import 'package:diary_journal/views/splash/splash_view.dart';
import 'package:diary_journal/views/start/start_binding.dart';
import 'package:diary_journal/views/start/start_view.dart';
import 'package:diary_journal/views/tab_bar_wrapper/tab_bar_wrapper_binding.dart';
import 'package:diary_journal/views/tab_bar_wrapper/tab_bar_wrapper_view.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
        name: Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: Paths.START,
        page: () => const StartView(),
        binding: StartBinding()),
    GetPage(
      name: Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
        name: Paths.TAB_BAR_WRAPPER,
        page: () => const TabBarWrapperView(),
        binding: TabBarWrapperBinding()),
    GetPage(
      name: Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.MOOD,
      page: () => const MoodView(),
      binding: MoodBinding(),
    ),
    GetPage(
        name: Paths.CREATE,
        page: () => const CreateView(),
        binding: CreateBinding()),
    GetPage(
        name: Paths.SHARE, page: () => ShareView(), binding: ShareBinding()),
    GetPage(
        name: Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding()),
  ];
}

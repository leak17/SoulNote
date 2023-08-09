import 'package:diary_journal/core/configs/tab_bar_config.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/home/home_view.dart';

import 'package:diary_journal/views/create/create_view.dart';
import 'package:diary_journal/views/mood/mood_view.dart';
import 'package:diary_journal/views/profile/profile_view.dart';
import 'package:diary_journal/views/share/share_view.dart';
import 'package:flutter/material.dart';

class TabBarConfig {
  static List<TabBarConfigItem> items = [
    TabBarConfigItem(
      title: 'Home',
      icon: Icons.home_outlined,
      path: Routes.HOME,
      screen: const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.home,
    ),
    TabBarConfigItem(
      title: 'Mood',
      icon: Icons.child_care_outlined,
      path: Routes.MOOD,
      screen: const MoodView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.child_care,
    ),
    TabBarConfigItem(
      title: 'Create',
      icon: Icons.add_circle_outline,
      path: Routes.HOME,
      screen: const CreateView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.add_circle,
    ),
    TabBarConfigItem(
      title: 'Share',
      icon: Icons.share_outlined,
      path: Routes.HOME,
      screen: const ShareView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.share,
    ),
    TabBarConfigItem(
      title: 'Profile',
      icon: Icons.person_2_outlined,
      path: Routes.HOME,
      screen: const ProfileView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.person_2,
    ),
  ];

  static Widget screenAt(int index) {
    return TabBarConfig.items[index].screen;
  }

  static GlobalKey<NavigatorState> navigationKeyAt(int index) {
    return TabBarConfig.items[index].key;
  }

  static List<BottomNavigationBarItem> bottomNavigationBarItems() {
    return List.generate(items.length, (index) {
      return BottomNavigationBarItem(
        label: items[index].title,
        icon: Icon(items[index].icon),
        activeIcon: Icon(
          items[index].activeIcon,
        ),
      );
    });
  }

  static List<Widget> navigationScreens([int selectedIndex = 0]) {
    return TabBarConfig.items.map((e) {
      Widget item = Navigator(
        key: e.key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => e.screen,
          );
        },
      );
      return item;
    }).toList();
  }
}

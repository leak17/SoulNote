import 'package:diary_journal/core/configs/tab_bar_config.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/home/home_view.dart';
<<<<<<< HEAD

import 'package:diary_journal/views/create/create_view.dart';
import 'package:diary_journal/views/mood/mood_view.dart';
import 'package:diary_journal/views/profile/profile_view.dart';
import 'package:diary_journal/views/share/share_view.dart';
=======
>>>>>>> 53d75f4 (signin screen)
import 'package:flutter/material.dart';

class TabBarConfig {
  static List<TabBarConfigItem> items = [
     TabBarConfigItem(
      title: 'Home',
<<<<<<< HEAD
      icon: Icons.home_outlined,
=======
      icon: Icons.home,
>>>>>>> 53d75f4 (signin screen)
      path: Routes.HOME,
      screen:  const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.home,
    ),
    TabBarConfigItem(
<<<<<<< HEAD
      title: 'Mood',
      icon: Icons.child_care_outlined,
      path: Routes.MOOD,
      screen:  const MoodView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.child_care,
    ),

    TabBarConfigItem(
      title: 'Create',
      icon: Icons.add_circle_outline,
      path: Routes.HOME,
      screen:  const CreateView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.add_circle,
    ),
    TabBarConfigItem(
      title: 'Share',
      icon: Icons.share_outlined,
      path: Routes.HOME,
      screen:  const ShareView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.share,
    ),
     TabBarConfigItem(
      title: 'Profile',
      icon: Icons.person_2_outlined,
      path: Routes.HOME,
      screen:  const ProfileView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.person_2,    ),
=======
      title: 'Maps',
      icon: Icons.games,
      path: Routes.HOME,
      screen:  const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.games,
    ),


    TabBarConfigItem(
      title: 'Photos',
      icon: Icons.school,
      path: Routes.HOME,
      screen:  const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.school,
    ),
    TabBarConfigItem(
      title: 'Account',
      icon: Icons.person,
      path: Routes.HOME,
      screen:  const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.person,
    ),
>>>>>>> 53d75f4 (signin screen)
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

import 'package:diary_journal/core/configs/tab_bar_config.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/views/home/home_view.dart';
import 'package:flutter/material.dart';

class TabBarConfig {
  static List<TabBarConfigItem> items = [
     TabBarConfigItem(
      title: 'Home',
      icon: Icons.home,
      path: Routes.HOME,
      screen:  const HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.home,
    ),
    TabBarConfigItem(
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

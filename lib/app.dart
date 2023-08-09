import 'package:bot_toast/bot_toast.dart';
import 'package:diary_journal/core/routes/app_pages.dart';
import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:diary_journal/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: ThemeConfig(false).themeData,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        );
      },
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}

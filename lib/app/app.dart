import 'package:flutter/material.dart';
import 'package:pennysmart/constants/app_themes.dart';
import 'package:pennysmart/navigation/app_navigation_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Penny Smart',
      theme: AppthemesData.themeMapping["blueTheme"],
      routerConfig: AppNavigation.router,
    );
  }
}

import 'package:flutter/material.dart';

class AppThemes extends ChangeNotifier {
  String currentAppTheme = "";

  AppThemes(String theme) {
    currentAppTheme = theme;
  }

  void setAppTheme(String newAppTheme) {
    currentAppTheme = newAppTheme;
    notifyListeners();
  }

  void setAppThemeWithoutNotifying(String newAppTheme) {
    currentAppTheme = newAppTheme;
  }
}

import 'package:flutter/services.dart';

class SystemHelper {
  static void statusBarColorChange(
      {required Color color, Brightness brightness = Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: color, statusBarIconBrightness: brightness));
  }

  static void statusBarColorChangeDefault(
      {Color statusBarColor = const Color.fromARGB(116, 255, 255, 255),
      Brightness brightness = Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: statusBarColor, statusBarIconBrightness: brightness));
  }

  static void statusBarColorChangeWithBrightness(
      Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: color, statusBarIconBrightness: brightness));
  }
}

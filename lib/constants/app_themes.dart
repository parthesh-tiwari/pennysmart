import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pennysmart/providers/AppThemesProvider.dart';
import 'package:provider/provider.dart';

class ThemeModal {
  String name;
  Color color;
  String associatedTheme;
  bool isForPremium;

  ThemeModal(
      {required this.associatedTheme,
      required this.name,
      required this.color,
      required this.isForPremium});
}

class AppthemesData {
  static ThemeData pinkTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge:
            GoogleFonts.poppins(fontSize: 32.0, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28.0,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24.0,
        ),
        headlineMedium: GoogleFonts.poppins(fontSize: 20.0),
        headlineSmall: GoogleFonts.poppins(fontSize: 18.0),
        titleLarge: GoogleFonts.poppins(fontSize: 16.0),
        bodyLarge: GoogleFonts.poppins(fontSize: 14.0),
        bodyMedium: GoogleFonts.poppins(fontSize: 12.0),
        titleMedium: GoogleFonts.poppins(fontSize: 14.0),
        titleSmall: GoogleFonts.poppins(fontSize: 12.0),
        labelLarge: GoogleFonts.poppins(fontSize: 14.0),
        bodySmall: GoogleFonts.poppins(fontSize: 12.0),
        labelSmall: GoogleFonts.poppins(fontSize: 14.0),
      ),
      datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Colors.transparent, backgroundColor: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24),
      ),
      cardTheme: const CardTheme(
          color: Colors.white, surfaceTintColor: Colors.transparent),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      iconTheme: const IconThemeData(color: Color(0xFFE8A7BF)),
      scaffoldBackgroundColor: const Color(0xFFfcf4f7),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: const Color(0xFFE8A7BF),
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(const Color(0xFFE8A7BF)),
        backgroundColor: const Color(0xFFfcf4f7),
      ));

  static ThemeData blueTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Colors.transparent, backgroundColor: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24)),
      cardTheme: const CardTheme(
          color: Colors.white, surfaceTintColor: Colors.transparent),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      iconTheme: const IconThemeData(color: Color(0xFF4290FB)),
      scaffoldBackgroundColor: Colors.grey.shade100,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: Color(0xFF4290FB),
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _createMaterialColor(Color(0xFF4290FB)),
          backgroundColor: Colors.grey.shade100));

  static ThemeData greenTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Colors.transparent, backgroundColor: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24)),
      cardTheme: const CardTheme(
          color: Colors.white, surfaceTintColor: Colors.transparent),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      iconTheme: const IconThemeData(color: Color(0xFF00D062)),
      scaffoldBackgroundColor: Color.fromARGB(255, 204, 247, 223),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: Color(0xFF00D062),
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _createMaterialColor(Color(0xFF00B4DB)),
          backgroundColor: Color.fromARGB(255, 204, 247, 223)));

  static ThemeData coralTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Colors.transparent, backgroundColor: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24)),
      cardTheme: const CardTheme(
          color: Colors.white, surfaceTintColor: Colors.transparent),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      iconTheme: const IconThemeData(color: Color(0xFFE3867D)),
      scaffoldBackgroundColor: const Color(0xFFFBEAEB),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: const Color(0xFFE3867D),
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(const Color(0xFFE3867D)),
        backgroundColor: const Color(0xFFFBEAEB),
      ));

  static ThemeData citrusTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Colors.transparent, backgroundColor: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24)),
      cardTheme: const CardTheme(
          color: Colors.white, surfaceTintColor: Colors.transparent),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),
      iconTheme: const IconThemeData(color: Color(0xFFFA3C5D)),
      scaffoldBackgroundColor: Color.fromARGB(255, 251, 233, 235),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: const Color(0xFFFA3C5D),
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(const Color(0xFFFA3C5D)),
        backgroundColor: Color.fromARGB(255, 251, 233, 235),
      ));

  static List<ThemeModal> themesList = [
    ThemeModal(
        associatedTheme: "pinkTheme",
        name: "Pink",
        color: Color(0xFFE8A7BF),
        isForPremium: false),
    ThemeModal(
        associatedTheme: "coralTheme",
        name: "Coral",
        color: Color(0xFFE3867D),
        isForPremium: false),
    ThemeModal(
        associatedTheme: "blueTheme",
        name: "Blue",
        color: Colors.blue.shade400,
        isForPremium: false),
    ThemeModal(
        associatedTheme: "greenTheme",
        name: "Emerald",
        color: Color(0xFF00D062),
        isForPremium: true),
    ThemeModal(
        associatedTheme: "citrusTheme",
        name: "Citrus",
        color: Color(0xFFFA3C5D),
        isForPremium: true),
  ];

  static Map<String, ThemeData> themeMapping = {
    "blueTheme": blueTheme,
    "greenTheme": greenTheme,
    "citrusTheme": citrusTheme,
  };
  static Map<String, LinearGradient> themeWiseGradient = {
    "blueTheme": const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF83CCFF),
        Color(0xFF4290FB),
      ],
    ),
  };

  static LinearGradient getThemeWiseGradient(BuildContext context) {
    AppThemes provider = Provider.of<AppThemes>(context, listen: false);

    return themeWiseGradient[provider.currentAppTheme] ??
        LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
          ],
        );
  }
}

MaterialColor _createMaterialColor(Color color) {
  final List strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final double strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

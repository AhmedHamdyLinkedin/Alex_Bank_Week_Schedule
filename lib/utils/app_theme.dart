import 'package:flutter/material.dart';

final themeController = ThemeController();

class AppThemes {
  /// LIGHT THEME
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffF5F7FB),

    colorScheme: const ColorScheme.light(primary: Color(0xff7B61FF)),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    cardColor: Colors.white,

    textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xff111827))),
  );

  /// DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff060B1F),

    colorScheme: const ColorScheme.dark(primary: Color(0xff7B61FF)),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    cardColor: const Color(0xff10182D),
  );
}

class ThemeController extends ChangeNotifier {
  bool isDark = true;

  ThemeMode get currentTheme => isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

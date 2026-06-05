//-> THEME CONTROLLER <-

import 'package:alex_bank_core_team_app/shared/components/custom_elevated_button.dart';
import 'package:alex_bank_core_team_app/shared/components/custom_text_form_field.dart';
import 'package:alex_bank_core_team_app/features/add_attendance/screens/add_attendance_screen.dart';
import 'package:alex_bank_core_team_app/features/auth/screen/auth_screen.dart';
import 'package:alex_bank_core_team_app/features/home/screens/day_details_screen.dart';
import 'package:alex_bank_core_team_app/features/home/screens/home_screen.dart';
import 'package:alex_bank_core_team_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

//-> APP <-
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Alex Attend',
          themeMode: themeController.currentTheme,
          //-> LIGHT THEME <-
          theme: AppThemes.lightTheme,
          //-> DARK THEME <-
          darkTheme: AppThemes.darkTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}

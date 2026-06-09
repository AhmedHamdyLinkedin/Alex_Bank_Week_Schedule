import 'package:alex_bank_core_team_app/features/auth/screen/auth_screen.dart';
import 'package:alex_bank_core_team_app/features/home/screens/home_screen.dart';
import 'package:alex_bank_core_team_app/shared/components/app_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        /// Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingWidget();
        }

        /// Error
        if (snapshot.hasError) {
          return const AuthScreen();
        }

        /// Authenticated
        if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        }

        /// Not Authenticated
        return const AuthScreen();
      },
    );
  }
}

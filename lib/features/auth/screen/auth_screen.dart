import 'package:alex_bank_core_team_app/components/app_logo.dart';
import 'package:alex_bank_core_team_app/components/dot_pattern.dart';
import 'package:alex_bank_core_team_app/features/auth/widgets/sign_in_section.dart';
import 'package:alex_bank_core_team_app/features/auth/widgets/sign_up_section.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true;
  void toggleScreen() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Container(
            key: ValueKey(isSignUp),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: isDark
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF020617),
                        Color(0xFF000B2D),
                        Color(0xFF020617),
                      ],
                    )
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF9F9FC), Color(0xFFF2F2F7)],
                    ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 18,
                  left: 16,
                  child: DotPattern(isDark: isDark),
                ),
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 430),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          AppLogo(isDark: isDark),
                          const SizedBox(height: 18),
                          isSignUp
                              ? SignUpSection(
                                  isDark: isDark,
                                  onToggle: toggleScreen,
                                  size: size,
                                )
                              : SignInSection(
                                  isDark: isDark,
                                  onToggle: toggleScreen,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:alex_bank_core_team_app/shared/components/custom_elevated_button.dart';
import 'package:alex_bank_core_team_app/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInSection extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const SignInSection({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        Text(
          'Welcome Back!',
          style: TextStyle(
            color: const Color(0xFF7B61FF),
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          'Please sign in to continue',
          style: TextStyle(
            color: isDark ? Colors.white70 : Colors.black54,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 38),

        CustomTextFormField(
          hint: 'Email',
          prefixIcon: Icons.mail_outline_rounded,
          isDark: isDark,
        ),

        const SizedBox(height: 22),

        CustomTextFormField(
          hint: 'Password',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: true,
          isDark: isDark,
        ),

        const SizedBox(height: 14),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: const Color(0xFF7B61FF),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 34),

        CustomElevatedButton(title: 'Sign In', onTap: () {}),

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black54,
                fontSize: 16,
              ),
            ),

            GestureDetector(
              onTap: onToggle,
              child: const Text(
                'Register now',
                style: TextStyle(
                  color: Color(0xFF7B61FF),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:alex_bank_core_team_app/shared/components/custom_elevated_button.dart';
import 'package:alex_bank_core_team_app/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpSection extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;
  final Size size;

  const SignUpSection({
    super.key,
    required this.isDark,
    required this.onToggle,
    required this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF7B61FF).withOpacity(0.10),
              ),
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF7B61FF).withOpacity(0.35),
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 2,
              child: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF7B61FF), Color(0xFFB56CFF)],
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Text(
          'Tap to change photo',
          style: TextStyle(
            color: Color(0xFF8B6CFF),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 26),
        CustomTextFormField(
          hint: 'Username',
          prefixIcon: Icons.person_outline_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 18),
        CustomTextFormField(
          hint: 'ICL',
          prefixIcon: Icons.badge_outlined,
          isDark: isDark,
        ),
        const SizedBox(height: 18),
        CustomTextFormField(
          hint: 'Email',
          prefixIcon: Icons.mail_outline_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 18),
        CustomTextFormField(
          hint: 'Password',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: true,
          isDark: isDark,
        ),
        const SizedBox(height: 18),
        CustomTextFormField(
          hint: 'Confirm Password',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: true,
          isDark: isDark,
        ),
        const SizedBox(height: 28),
        CustomElevatedButton(title: 'Sign Up', onTap: () {}),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already Registered? ',
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black54,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: onToggle,
              child: const Text(
                'Sign In',
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

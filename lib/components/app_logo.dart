import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final bool isDark;
  const AppLogo({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF5B4BFF), Color(0xFFB56CFF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7B61FF).withOpacity(0.35),
                blurRadius: 25,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.12),
              ),
              child: const Icon(
                Icons.verified_user_rounded,
                color: Colors.white,
                size: 42,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
            children: [
              TextSpan(
                text: 'Alex ',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              TextSpan(
                text: 'Attend',
                style: TextStyle(color: Color(0xFF8B6CFF)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Smart Employee Attendance System',
          style: TextStyle(
            color: isDark ? Colors.white.withOpacity(0.78) : Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

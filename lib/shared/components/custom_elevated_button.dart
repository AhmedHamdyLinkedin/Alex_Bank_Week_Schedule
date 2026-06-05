import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 68,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),

          gradient: const LinearGradient(
            colors: [Color(0xFF6B4EFF), Color(0xFFBC7DFF)],
          ),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7B61FF).withOpacity(0.35),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DotPattern extends StatelessWidget {
  final bool isDark;

  const DotPattern({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,

      child: Wrap(
        spacing: 6,
        runSpacing: 6,

        children: List.generate(
          16,
          (index) => Container(
            width: 4,
            height: 4,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF9B7CFF).withOpacity(isDark ? 0.65 : 0.45),
            ),
          ),
        ),
      ),
    );
  }
}

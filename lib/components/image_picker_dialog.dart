import 'package:alex_bank_core_team_app/components/custom_list_tile.dart';
import 'package:flutter/material.dart';

class BottomSheetPreview extends StatelessWidget {
  final bool isDark;

  const BottomSheetPreview({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),

        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,

        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.06)
              : Colors.black.withOpacity(0.04),
        ),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose Option',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Icon(
                Icons.close,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ],
          ),

          const SizedBox(height: 18),

          CustomListTile(
            isDark: isDark,
            icon: Icons.camera_alt_outlined,
            title: 'Camera',
            subtitle: 'Take a new photo',
          ),

          const SizedBox(height: 14),

          CustomListTile(
            isDark: isDark,
            icon: Icons.photo_library_outlined,
            title: 'Gallery',
            subtitle: 'Choose from gallery',
          ),
        ],
      ),
    );
  }
}

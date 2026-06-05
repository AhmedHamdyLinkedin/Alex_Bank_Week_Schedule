import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 20,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            icon: Icons.home_rounded,
            title: 'Home',
            isSelected: true,
          ),
          BottomNavItem(
            icon: Icons.notifications_rounded,
            title: 'Notifications',
            isSelected: false,
          ),
          BottomNavItem(icon: Icons.person_outline_rounded, title: 'Profile'),
        ],
      ),
    );
  }
}

///
/// BOTTOM NAV ITEM
///
class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? theme.colorScheme.primary : Colors.grey),

        const SizedBox(height: 6),

        Text(
          title,
          style: TextStyle(
            color: isSelected ? theme.colorScheme.primary : Colors.grey,
          ),
        ),
      ],
    );
  }
}

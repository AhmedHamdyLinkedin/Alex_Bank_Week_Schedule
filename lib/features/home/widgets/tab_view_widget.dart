import 'package:alex_bank_core_team_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({
    super.key,
    required this.tabTitles,
    required this.onTapSelect,
    this.margin,
  });

  final List<String> tabTitles;
  final Function(int selectedTab) onTapSelect;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = themeController.isDark;
    return Container(
      margin: margin,
      height: 60,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,

        //-> THIS MAKES WHOLE TAB FILLED <-
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.7),
            ],
          ),
        ),

        dividerColor: Colors.transparent,

        labelColor: Colors.white,
        unselectedLabelColor: isDark ? Colors.white60 : Colors.black54,

        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (alue) => onTapSelect(alue),
        tabs: tabTitles.map((tabTitle) {
          return Tab(text: tabTitle);
        }).toList(),
      ),
    );
  }
}

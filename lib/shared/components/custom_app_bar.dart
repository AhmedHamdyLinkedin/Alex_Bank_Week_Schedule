import 'package:flutter/material.dart';

PreferredSizeWidget? getCustomAppBar(
  BuildContext context, {
  String? title,
  String? primaryColorTitle,
  List<Widget>? actions,
}) {
  if (title == null) {
    return null;
  }

  final theme = Theme.of(context);

  return AppBar(
    actions: actions,
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: theme.textTheme.bodyMedium?.color,
        ),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: primaryColorTitle ?? '',
            style: TextStyle(color: theme.colorScheme.primary),
          ),
        ],
      ),
    ),
  );
}

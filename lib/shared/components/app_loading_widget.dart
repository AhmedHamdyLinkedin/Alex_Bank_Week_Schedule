import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.message = 'Preparing your work schedule',
    this.subTitle = "We're setting things up for you.\nThis won't take long!",
  });

  final String message;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                children: [
                  const TextSpan(text: 'Alex '),
                  TextSpan(
                    text: 'Attend',
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                ],
              ),
            ),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.65),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
            Center(
              child: LoadingAnimationWidget.progressiveDots(
                color: theme.colorScheme.primary,
                size: 50,
              ),
            ),
          ],
        );
      },
    );
  }
}

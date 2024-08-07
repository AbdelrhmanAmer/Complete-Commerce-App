import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class AccountPrompt extends StatelessWidget {
  const AccountPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionPressed,
    this.buttonTextColor = AppColor.primaryColor,
    this.textDecoration = TextDecoration.none,
  });

  final String promptText;
  final String actionText;
  final Color buttonTextColor;
  final VoidCallback onActionPressed;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText, style: Theme.of(context).textTheme.bodyMedium),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 14,
              decoration: textDecoration,
              color: buttonTextColor,
            ),
          ),
        )
      ],
    );
  }
}

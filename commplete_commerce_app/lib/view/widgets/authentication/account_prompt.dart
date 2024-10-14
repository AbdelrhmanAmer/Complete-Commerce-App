import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class AccountPrompt extends StatelessWidget {
  const AccountPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionPressed,
    this.buttonTextColor = AppColor.primaryColor,
    this.textStyle,
    this.textDecoration = TextDecoration.none,
  });

  final String promptText;
  final String actionText;
  final Color buttonTextColor;
  final TextStyle? textStyle;
  final VoidCallback onActionPressed;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText,
            style: textStyle ?? Theme.of(context).textTheme.labelMedium),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,

              decoration: textDecoration,
              color: buttonTextColor,
            ),
          ),
        )
      ],
    );
  }
}

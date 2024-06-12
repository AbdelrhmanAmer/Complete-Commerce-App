import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class AccountPrompt extends StatelessWidget {
  const AccountPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionPressed,
  });

  final String promptText;
  final String actionText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

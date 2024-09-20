import 'package:flutter/material.dart';

class LabelAndValueText extends StatelessWidget {
  const LabelAndValueText({
    super.key,
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

preferencesAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      'Preferences',
      style: Theme.of(context).textTheme.titleLarge,
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: const Text(
          'Reset',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

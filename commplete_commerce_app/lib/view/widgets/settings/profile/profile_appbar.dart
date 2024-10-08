import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

profileAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      'Profile',
      style: Theme.of(context).textTheme.titleLarge,
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: const Text(
          'Edit',
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

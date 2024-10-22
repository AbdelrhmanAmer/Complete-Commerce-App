import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/constant/color.dart';

profileAppbar(BuildContext context, {bool editMode = false}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      'Profile',
      style: Theme.of(context).textTheme.titleMedium,
    ),
    actions: [
      editMode
          ? InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('assets/icons/info.svg'),
              ),
            )
          : TextButton(
              onPressed: () {
                Get.toNamed(Routes.editProfile);
              },
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

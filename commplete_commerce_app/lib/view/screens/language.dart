import 'package:commplete_commerce_app/core/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';
import '../../core/localization/change_local.dart';
import '../../core/constant/color.dart';
import '../widgets/custom_button.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('chooseLang'.tr,
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,

              text: "arabic".tr,
              press: () {
                controller.changeLang("ar");
                Get.toNamed(Routes.onBoarding);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              text: "english".tr,
              press: () {
                controller.changeLang("en");
                Get.toNamed(Routes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}

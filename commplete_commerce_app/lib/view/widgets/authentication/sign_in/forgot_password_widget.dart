import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/app_routes.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Get.toNamed(Routes.passwordRecovery);
      },
      child: Text("Forgot Password",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColor.primaryColor, fontWeight: FontWeight.w500)),
    );
  }
}

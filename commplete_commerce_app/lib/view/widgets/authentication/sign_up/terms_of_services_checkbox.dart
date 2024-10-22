import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/sign_up/sign_up_controller.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../../core/constant/color.dart';

class TermsOfServiceCheckBox extends StatelessWidget {
  const TermsOfServiceCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Row(
        children: [
          Checkbox(
            onChanged: (_) => controller.toggleTermsState(),
            value: controller.acceptTerms,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "I agree with the",
                style: Theme.of(context).textTheme.labelMedium,
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.termOfService);
                      },
                    text: " Terms of service ",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(
                    text: "& privacy policy.",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

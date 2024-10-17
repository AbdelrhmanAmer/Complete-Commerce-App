import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/maskEmail.dart';
import '../../../../core/functions/mask_phone_number.dart';
import '../../../../controller/authentication/forgotPassword/choose_verification_method_controller.dart';
import '../../../../core/constant/constants.dart';
import '../../../widgets/authentication/choose_verification_method/selectableTextFormField.dart';
import '../../../widgets/custom_button.dart';

class ChooseVerificationMethod extends StatelessWidget {
  const ChooseVerificationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChooseVerificationMethodController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .4,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/images/password.png',
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GetBuilder<ChooseVerificationMethodController>(
                  builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .01),
                      Text('Choose Verification Method',
                          style: Theme.of(context).textTheme.displaySmall),
                      SizedBox(height: size.height * .01),
                      Text(
                          'we\'ll send you a verification code to reset your password',
                          style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(height: size.height * .1),
                      SelectableTile(
                        initialValue: maskEmail(controller.email!),
                        suffixIcon: 'assets/icons/Message.svg',
                        selected: controller.sendEmail,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * .015),
                      SelectableTile(
                        initialValue: maskPhoneNumber(controller.phone ?? '00 0000 0000'),
                        suffixIcon: 'assets/icons/Call.svg',
                        selected: !controller.sendEmail,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * .06),
                      CustomButton(
                          text: 'Next', press: controller.sendEmailOtp),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

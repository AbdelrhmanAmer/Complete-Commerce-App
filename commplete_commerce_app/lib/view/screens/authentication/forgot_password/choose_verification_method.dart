import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/maskEmail.dart';
import '../../../../controller/authentication/forgotPassword/choose_verification_method_controller.dart';
import '../../../../core/constant/constants.dart';
import '../../../widgets/authentication/choose_verification_method/selectableTextFormField.dart';
import '../../../widgets/custom_button.dart';

class ChooseVerificationMethod extends StatelessWidget {
  const ChooseVerificationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseVerificationMethodController());

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
                  child: Get.isDarkMode
                      ? Image.asset('assets/Illustration/Password_dark.png')
                      : Image.asset('assets/Illustration/Password.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                      suffixIcon: 'assets/icons/Call.svg',
                      selected: true,
                      onTap: () {},
                    ),
                    SizedBox(height: size.height * .015),
                    SelectableTile(
                      initialValue: '0106******05',
                      suffixIcon: 'assets/icons/Message.svg',
                      selected: false,
                      onTap: () {},
                    ),
                    SizedBox(height: size.height * .06),
                    CustomButton(text: 'Next', press: controller.goToOtpScreen),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

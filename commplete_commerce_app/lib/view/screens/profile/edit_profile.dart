import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/authentication/input_decoration.dart';
import '../../../controller/profile/edit_profile_controller.dart';
import '../../../core/functions/validate_input.dart';
import '../../../../core/constant/constants.dart';
import '../../widgets/root/settings/profile/edit_profile/edit_profile_image_picker.dart';
import '../../widgets/root/settings/profile/profile_appbar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    final color = Theme
        .of(context)
        .colorScheme
        .onSurface;

    return SafeArea(
      child: Scaffold(
        appBar: noticeAppbar(context, 'profile', editMode: true),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<EditProfileController>(
            builder: (controller) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const EditImagePicker(),
                    SizedBox(height: size.height * .02),
                    Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          TextFormField(
                            style: Get.textTheme.bodyLarge,
                            decoration: inputDecoration(
                              context,
                              hintText: "email",
                              iconColor: color,
                              iconPath: 'assets/icons/Message.svg',
                            ),
                            validator: (val) {
                              return validateInput(val!, 'email');
                            },
                            controller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: size.height * .02),
                          TextFormField(
                            style: Get.textTheme.bodyLarge,
                            decoration: inputDecoration(
                              context,
                              hintText: "Username",
                              iconColor: color,
                              iconPath: 'assets/icons/Profile.svg',
                            ),
                            validator: (val) {
                              return validateInput(val!, 'username');
                            },
                            controller: controller.username,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: size.height * .02),
                          TextFormField(
                            style: Get.textTheme.bodyLarge,
                            decoration: inputDecoration(
                              context,
                              hintText: "Address",
                              iconColor: color,
                              iconPath: 'assets/icons/Address.svg',
                            ),
                            validator: (val) {
                              return validateInput(val!, 'address',
                                  min: 6, max: 50);
                            },
                            controller: controller.address,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: size.height * .02),
                          TextFormField(
                            style: Get.textTheme.bodyLarge,
                            decoration: inputDecoration(
                              context,
                              hintText: "Phone number",
                              iconColor: color,
                              iconPath: 'assets/icons/Call.svg',
                            ),
                            validator: (val) {
                              return validateInput(
                                  val!, 'phone', min: 6, max: 50);
                            },
                            controller: controller.phone,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                        text: 'Done', press: controller.finishEditing),
                    SizedBox(height: size.height * .03),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}


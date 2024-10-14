import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settings/profile_controller.dart';
import '../../../core/functions/formatPhoneNumber.dart';
import '../../widgets/settings/personalTile.dart';
import '../../widgets/settings/profile/fieldProfileTile.dart';
import '../../widgets/settings/profile/profile_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    final TextStyle labelStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold);

    return SafeArea(
      child: Scaffold(
        appBar: profileAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              PersonalTile(
                username: controller.user!.username!,
                email: controller.user!.email!,
                onPress: () {},
                justView: true,
              ),
              const SizedBox(height: 30),
              FieldProfileTile(
                label: 'Name',
                widget: SelectableText(controller.user!.username!,
                    style: labelStyle),
              ),
              const Divider(
                height: 40,
                color: Colors.grey,
              ),
              FieldProfileTile(
                label: 'Phone Number',
                widget: SelectableText(
                  formatPhoneNumber(controller.user!.phone!),
                  style: labelStyle,
                ),
              ),
              const Divider(height: 40, color: Colors.grey),
              FieldProfileTile(
                label: 'Address',
                widget: SelectableText(
                  controller.user!.address!,
                  style: labelStyle,
                ),
              ),
              const Divider(height: 40, color: Colors.grey),
              FieldProfileTile(
                label: 'Email',
                widget: SelectableText(
                  controller.user!.email!,
                  style: labelStyle,
                ),
              ),
              const Divider(height: 40, color: Colors.grey),
              FieldProfileTile(
                label: 'Password',
                widget: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Change password',
                    style: TextStyle(fontSize: 14),
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


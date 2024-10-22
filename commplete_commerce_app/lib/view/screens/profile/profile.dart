import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile/profile_controller.dart';
import '../../../core/functions/formatPhoneNumber.dart';
import '../../widgets/root/settings/personalTile.dart';
import '../../widgets/root/settings/profile/fieldProfileTile.dart';
import '../../widgets/root/settings/profile/profile_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final TextStyle labelStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.bold);

    return SafeArea(
      child: Scaffold(
        appBar: profileAppbar(context),
        body: SingleChildScrollView(
          child: Obx(() {
            final user = Get.find<ProfileController>().user;

            if (user == null) {
              return const Center(child: Text('No user data found!'));
            }

            return Column(
              children: [
                const SizedBox(height: 10),
                PersonalTile(
                  username: user.username!,
                  email: user.email!,
                  onPress: () {},
                  justView: true,
                ),
                const SizedBox(height: 30),
                FieldProfileTile(
                  label: 'Id',
                  widget: SelectableText(user.id!, style: labelStyle),
                ),
                const Divider(height: 40, color: Colors.grey),
                FieldProfileTile(
                  label: 'Name',
                  widget: SelectableText(user.username!, style: labelStyle),
                ),
                const Divider(height: 40, color: Colors.grey),
                FieldProfileTile(
                  label: 'Phone Number',
                  widget: SelectableText(
                    formatPhoneNumber(user.phone!),
                    style: labelStyle,
                  ),
                ),
                const Divider(height: 40, color: Colors.grey),
                FieldProfileTile(
                  label: 'Address',
                  widget: SelectableText(
                    user.address!,
                    style: labelStyle,
                  ),
                ),
                const Divider(height: 40, color: Colors.grey),
                FieldProfileTile(
                  label: 'Email',
                  widget: SelectableText(
                    user.email!,
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
            );
          }),
        ),
      ),
    );
  }
}

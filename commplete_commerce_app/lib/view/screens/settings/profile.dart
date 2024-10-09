import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settings/profile_controller.dart';
import '../../widgets/settings/personalTile.dart';
import '../../widgets/settings/profile/profile_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    final labelStyle = Theme.of(context).textTheme.bodyLarge;
    final valueStyle = Theme.of(context)
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name', style: labelStyle),
                    Text(controller.user!.username!, style: labelStyle),
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

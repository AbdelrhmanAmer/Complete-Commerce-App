import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile/settings_controller.dart';
import '../../widgets/settings/settings_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              SettingsBody(),
            ],
          ),
        ),
      ),
    );
  }
}

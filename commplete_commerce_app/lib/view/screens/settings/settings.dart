import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/settings/settings_controller.dart';
import '../../widgets/root/settings/settings_body.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

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

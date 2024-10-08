import 'package:commplete_commerce_app/controller/home_controller.dart';
import 'package:commplete_commerce_app/controller/settings/profile_controller.dart';
import 'package:commplete_commerce_app/view/widgets/settings/personalTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user.dart';
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
    final User user = HomeController.user;

    return SafeArea(
      child: Scaffold(
        appBar: profileAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              PersonalTile(
                username: user.username!,
                email: user.email!,
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
                    Text(user.username!, style: labelStyle),
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

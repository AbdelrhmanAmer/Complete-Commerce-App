import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: themeController.toggleTheme,
              icon: Icon(themeController.isDarkMode.value
                  ? Icons.sunny
                  : Icons.nightlight_rounded),
            ),
          )
        ],
      ),
      body: const Center(child: Text('HomePage')),
    );
  }
}

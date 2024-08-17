import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    HomeController controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${controller.id}'),
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
      ),
    );
  }
}

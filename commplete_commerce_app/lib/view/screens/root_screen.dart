import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../controller/root_controller.dart';
import '../widgets/root/button_nav_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootController());

    return GetBuilder<RootController>(
      builder: ((controller) {
        return Scaffold(
          bottomNavigationBar: ButtonNavBar(controller: controller),
          body: controller.pageList.elementAt(controller.currentPageIndex),
        );
      }),
    );
  }
}

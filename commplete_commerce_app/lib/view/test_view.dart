import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/DataView.dart';
import '../controller/test_controller.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return DataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (ctx, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}

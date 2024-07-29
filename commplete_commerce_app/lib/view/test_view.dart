import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../controller/test_controller.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: Text('Loading'));
          } else if (controller.statusRequest ==
              StatusRequest.internetFailure) {
            return const Center(child: Text('Offline Failure'));
          } else if (controller.statusRequest == StatusRequest.serverFailure) {
            return const Center(child: Text('Server Failure'));
          }else if (controller.statusRequest == StatusRequest.failure) {
            return const Center(child: Text('Failure'));
          }  else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (ctx, index) {
                return Text('${controller.data}');
              },
            );
          }
        },
      ),
    );
  }
}

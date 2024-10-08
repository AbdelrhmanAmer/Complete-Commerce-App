import 'dart:convert';

import 'package:get/get.dart';

import '../home_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/user.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();
  User user = User();

  @override
  void onInit() {
    super.onInit();
    user = HomeController.user;
  }
}

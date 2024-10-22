import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/set_shared_user.dart';
import '../../core/functions/get_shared_user.dart';
import '../../core/services/user_service.dart';
import '../../view/screens/settings/settings.dart';
import '../../view/screens/root/favorites.dart';
import '../../view/screens/root/home.dart';

class RootController extends GetxController {
  int currentPageIndex = 0;

  UserService userService = Get.put(UserService());

  List<Widget> pageList = [
    const Home(),
    const Center(child: Text('Categories', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Cart', style: TextStyle(fontSize: 20))),
    const Favorites(),
    const Settings(),
  ];

  changePage(int i) {
    currentPageIndex = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['user'] != null) {
      userService.user.value = Get.arguments['user'];
    }else{
      userService.user.value = getSharedUser();
    }
  }

  @override
  void dispose() {
    setSharedUser(userService.user.value!);

    super.dispose();
  }
}

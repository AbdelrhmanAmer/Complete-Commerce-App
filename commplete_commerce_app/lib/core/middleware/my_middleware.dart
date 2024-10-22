import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constant/app_routes.dart';
import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: Routes.root);
    }
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: Routes.signIn);
    }
    return null;
  }
}

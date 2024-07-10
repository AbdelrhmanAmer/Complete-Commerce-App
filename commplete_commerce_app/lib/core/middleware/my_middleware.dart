import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:commplete_commerce_app/core/services/services.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('onboarding') == '1') {
      return const RouteSettings(name: Routes.signIn);
    }
    return null;
  }
}
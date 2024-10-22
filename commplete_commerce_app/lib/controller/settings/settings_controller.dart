import 'package:get/get.dart';

import '../../core/services/services.dart';
import '../../core/constant/app_routes.dart';
import '../../core/services/user_service.dart';
import '../../data/model/user.dart';

class SettingsController extends GetxController {
  UserService userService = Get.find();
  MyServices myServices = Get.find();

  User? get user => userService.user.value;

  logout() {
    userService.clearUser();
    myServices.sharedPreferences.setString('step', '1');
    Get.offAllNamed(Routes.signIn);
  }
}

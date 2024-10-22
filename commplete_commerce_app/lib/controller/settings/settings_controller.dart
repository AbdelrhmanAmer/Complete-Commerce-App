import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';
import '../../core/services/user_service.dart';
import '../../data/model/user.dart';

class SettingsController extends GetxController {
  UserService userService = Get.find();

  User? get user => userService.user.value;

  logout() {
    userService.clearUser();
    Get.offAllNamed(Routes.signIn);
  }
}

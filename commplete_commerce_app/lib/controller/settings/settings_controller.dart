import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';
import '../../core/functions/get_shared_user.dart';
import '../../core/services/services.dart';
import '../../data/model/user.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  User? user;

  @override
  onInit() {
    super.onInit();
    user = getSharedUser(myServices);
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Routes.signIn);
  }
}

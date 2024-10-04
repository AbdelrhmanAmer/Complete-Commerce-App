import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';
import '../../core/services/services.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Routes.signIn);
  }
}

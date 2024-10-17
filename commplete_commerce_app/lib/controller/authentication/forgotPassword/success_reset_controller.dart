import 'package:get/get.dart';

import '../../../core/constant/app_routes.dart';

class SuccessResetController extends GetxController {
  goToLogIn() {
    Get.offAllNamed(Routes.signIn);
  }
}

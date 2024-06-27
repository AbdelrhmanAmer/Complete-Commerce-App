import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class SuccessResetPassConroller extends GetxController {
  goToSignIn() {
    Get.offAllNamed(Routes.signIn);
  }
}

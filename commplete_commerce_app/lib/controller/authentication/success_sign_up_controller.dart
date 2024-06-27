import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

class SuccessSignUpController extends GetxController {
  goToSignIn() {
    Get.offAllNamed(Routes.signIn);
  }
}

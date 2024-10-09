import 'package:get/get.dart';

import '../../core/functions/get_shared_user.dart';
import '../../core/services/services.dart';
import '../../data/model/user.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();
  User? user;

  @override
  void onInit() {
    super.onInit();
    user = getSharedUser(myServices);
  }
}

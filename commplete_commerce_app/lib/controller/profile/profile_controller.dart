import 'package:get/get.dart';

import '../../core/services/user_service.dart';
import '../../data/model/user.dart';

class ProfileController extends GetxController {
  final UserService userService = Get.find();

  User? get user => userService.user.value;

}

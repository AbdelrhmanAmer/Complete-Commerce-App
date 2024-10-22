import 'package:get/get.dart';

import '../../data/model/user.dart';

class UserService extends GetxService {
  var user = Rx<User?>(null);

  void setUser(User newUser) {
    user.value = newUser;
  }

  void updateUserDetails(
      {String? email, String? username, String? address, String? phone}) {
    user.update((val) {
      val?.email = email;
      val?.username = username;
      val?.phone = phone;
      val?.address = address;
    });
  }

  void clearUser() {
    user.value = null;
  }
}

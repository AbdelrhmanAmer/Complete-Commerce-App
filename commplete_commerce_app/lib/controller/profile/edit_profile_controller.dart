import 'package:commplete_commerce_app/core/functions/set_shared_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/services/user_service.dart';
import '../../data/data_source/remote/profile/edit_profile.dart';
import '../../data/model/user.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handle_response_status.dart';

class EditProfileController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.error;
  EditProfileData editProfileData = EditProfileData(Get.find());

  UserService userService = Get.find();

  User? get user => userService.user.value;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController address;

  @override
  void onInit() {
    super.onInit();

    username = TextEditingController(text: user?.username ?? '');
    phone = TextEditingController(text: user?.phone ?? '');
    email = TextEditingController(text: user?.email ?? '');
    address = TextEditingController(text: user?.address ?? '');
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }

  finishEditing() async {
    FormState? fromData = formState.currentState;
    if (fromData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await editProfileData.editProfile(
        id: user!.id!,
        email: email.text,
        username: username.text,
        address: address.text,
        phone: phone.text,
      );

      userService.updateUserDetails(
        email: email.text,
        phone: phone.text,
        address: address.text,
        username: username.text,
      );

      statusRequest = handleResponseStatus(response);
      update();

      if (statusRequest == StatusRequest.success) {
        setSharedUser(userService.user.value!);
        Get.back();
      }
    }
  }
}

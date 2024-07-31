import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../class/status_request.dart';

StatusRequest handleData(response) {
  if (response is StatusRequest) {
    if (response == StatusRequest.emailOrPhoneExists) {
      Get.defaultDialog(
          title: 'Warning', middleText: 'Phone Number Or Email Already Exists');
    } else if (response == StatusRequest.successInsertFailedSending) {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Faild to send email!',
          content: const Text(
              'your data have been inserted successfully, but we have a problem in sending your email to you'));
    } else if (response == StatusRequest.insertFailure) {
      Get.defaultDialog(title: 'Error', middleText: 'Faild to insert data!');
    }
    return response;
  } else {
    return StatusRequest.success;
  }
}

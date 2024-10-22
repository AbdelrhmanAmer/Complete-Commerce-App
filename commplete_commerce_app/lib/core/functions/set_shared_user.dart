import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../services/services.dart';

void setSharedUser(User user) {
  MyServices myServices = Get.find();

  String userJson = jsonEncode(user.toJson());
  myServices.sharedPreferences.setString('user', userJson);
  log('userJson, $userJson');
}

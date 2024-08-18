import 'package:get/get.dart';

import '../core/services/services.dart';

class HomeController extends GetxController{
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? phone;
  String? email;
  String? address;

  @override
  void onInit() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
    email = myServices.sharedPreferences.getString('email');
    phone = myServices.sharedPreferences.getString('phone');
    address = myServices.sharedPreferences.getString('address');
    super.onInit();
  }
}
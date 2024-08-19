import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:commplete_commerce_app/core/functions/handle_response_status.dart';
import 'package:commplete_commerce_app/data/data_source/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;
  List data = [];
  List categories = [];
  List ratedItems = [];
  List items = [];
  String? username;
  String? id;
  String? phone;
  String? email;
  String? address;

  getData() async {
    statusRequest.value = StatusRequest.loading;
    update();

    var response = await homeData.getData();
    statusRequest.value = handleResponseStatus(response);
    if (statusRequest.value == StatusRequest.success) {
      categories.addAll(response['categories']);
    } else {
      statusRequest.value = StatusRequest.failure;
    }
    update();
  }

  initiateData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
    email = myServices.sharedPreferences.getString('email');
    phone = myServices.sharedPreferences.getString('phone');
    address = myServices.sharedPreferences.getString('address');
  }

  @override
  void onInit() {
    initiateData();
    getData();
    super.onInit();
  }
}

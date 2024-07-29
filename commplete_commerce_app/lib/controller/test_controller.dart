import 'package:get/get.dart';

import '../core/functions/handle_data.dart';
import '../core/class/status_request.dart';
import '../data/data_source/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.loading;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await testData.getData();

    statusRequest = handleData(response);

    if (statusRequest == StatusRequest.success) {
      if (response.containsKey('data')) {
        data.addAll(response['data']);
      }
    } 

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}

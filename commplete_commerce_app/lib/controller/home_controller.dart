import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

import '../data/data_source/remote/home_data.dart';
import '../data/model/category.dart';
import '../data/model/item.dart';
import '../core/class/status_request.dart';
import '../core/functions/handle_response_status.dart';
import '../core/services/services.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  List<Category> categories = [];
  List<Item> discountedItems = [];
  List<Item> items = [];

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
      for (Map<String, dynamic> category in response['categories']) {
        categories.add(Category.fromJson(category));
      }
      for (Map<String, dynamic> item in response['items']) {
        if (item['item_discount'] != 0) {
          discountedItems.add(Item.fromJson(item));
        }
        items.add(Item.fromJson(item));
      }
    } else {
      statusRequest.value = StatusRequest.failure;
    }

    update();
  }

  goToItemsScreen(int categoryIndex){
    Get.toNamed(Routes.items, arguments: {
      'categories' : categories,
      'selectedCategory' : categoryIndex,
      'items' : items,
    });
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

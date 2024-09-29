import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
import '../data/data_source/remote/home_data.dart';
import '../data/model/category.dart';
import '../data/model/item/item.dart';
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
  static String? id;
  String? phone;
  String? email;
  String? address;

  @override
  void onInit() {
    initiateData();
    getData();

    super.onInit();
  }

  getData() async {
    statusRequest.value = StatusRequest.loading;

    var response = await homeData.getData(id!);
    statusRequest.value = handleResponseStatus(response);

    if (statusRequest.value == StatusRequest.success) {
      _processCategories(response['categories']);
      _processItems(response['items']);
    } else {
      statusRequest.value = StatusRequest.failure;
    }

    update();
  }

  _processCategories(List<dynamic> categoriesData) {
    categories
        .addAll(categoriesData.map((category) => Category.fromJson(category)));
  }

  _processItems(List<dynamic> itemsData) {
    for (Map<String, dynamic> item in itemsData) {
      var itemObject = Item.fromJson(item);
      items.add(itemObject);
      if (int.tryParse(item['item_discount'])! > 0) {
        discountedItems.add(itemObject);
      }
    }
  }

  goToItemsScreen(int categoryIndex) {
    Get.toNamed(Routes.items, arguments: {
      'categories': categories,
      'selectedCategory': categoryIndex,
    });
  }

  initiateData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
    email = myServices.sharedPreferences.getString('email');
    phone = myServices.sharedPreferences.getString('phone');
    address = myServices.sharedPreferences.getString('address');
  }

  // _populateFavoriteList() {
  //   FavoriteController favoriteController = Get.find<FavoriteController>();
  //   for (Item item in items) {
  //     favoriteController.isFavorite[item.itemId!] = item.favorite!;
  //   }
  // }
}

import 'package:commplete_commerce_app/data/model/item/base_item.dart';
import 'package:get/get.dart';

import '../../data/data_source/remote/home_data.dart';
import '../../data/model/category.dart';
import '../../core/services/user_service.dart';
import '../../core/functions/show_custom_snack_bar.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handle_response_status.dart';
import '../../data/model/user.dart';
import 'favorite_controller.dart';

class HomeController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  List<Item> offers = [];
  List<Category> categories = [];
  List<Item> discountedItems = [];
  List<Item> items = [];

  UserService userService = Get.find();
  late User user;

  @override
  void onInit() {
    super.onInit();
    user = userService.user.value!;
    getData();
  }

  Future<void> initializeControllers() async {
    await getData();

    Get.put(FavoriteController());
  }

  getData() async {
    statusRequest.value = StatusRequest.loading;

    if (user.id != null) {
      var response = await homeData.getData(user.id!);
      statusRequest.value = handleResponseStatus(response);

      if (statusRequest.value == StatusRequest.success) {
        _processCategories(response['categories']);
        _processItems(response['items']);
      } else {
        statusRequest.value = StatusRequest.failure;
      }
      update();
    } else {
      showCustomSnackBar(title: 'HomeController, User id is Null');
    }
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

  goToCategoryItemsScreen(int categoryIndex) {
    Get.toNamed(Routes.items, arguments: {
      'categories': categories,
      'selectedCategory': categoryIndex,
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/services/user_service.dart';
import '../../core/functions/show_custom_snack_bar.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_routes.dart';
import '../../data/data_source/remote/items_data.dart';
import '../../data/model/user.dart';
import '../../data/model/item/base_item.dart';
import '../../data/model/category.dart';
import '../../data/model/item/item.dart';

class CategoryItemsController extends GetxController {
  List<Category> categories = <Category>[];
  List<Item> items = <Item>[];
  int selectedIndex = 0;

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;

  UserService userService = Get.find();

  User? get user => userService.user.value;

  List<Item> selectedCategoryItems = <Item>[];

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeController();
    });
  }

  void initializeController() async {
    statusRequest = StatusRequest.loading;
    await getItems();

    if (Get.arguments != null) {
      var args = Get.arguments;
      if (args['categories'] != null) {
        categories = Get.arguments['categories'];
      }
      if (args['selectedCategory'] != null) {
        selectedIndex = Get.arguments['selectedCategory'];
      }
      update();
    }
    filterCategoryItems(selectedIndex);
  }

  getItems() async {
    if (user?.id != null) {
      var response = await itemsData.postData(user!.id!);
      statusRequest = handleResponseStatus(response);
      update();
      if (statusRequest == StatusRequest.success) {
        List itemsList = response['items'];
        items = itemsList.map((item) => Item.fromJson(item)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {
      showCustomSnackBar(title: 'CategoryItemsController, User is null');
    }
  }

  void changeSelectedCategory(int newIndex) {
    selectedIndex = newIndex;
    update();
    filterCategoryItems(newIndex);
  }

  goToItemsDetailsScreen(BaseItem item) {
    Get.toNamed(Routes.itemDetails, arguments: {'item': item});
  }

  void filterCategoryItems(int categoryIndex) {
    String? selectedCategoryId = categories[categoryIndex].categoryId;
    selectedCategoryItems = items
        .where((Item item) => item.itemCategoryId == selectedCategoryId)
        .toList();
    update();
  }
}

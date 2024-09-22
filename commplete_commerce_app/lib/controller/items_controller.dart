import 'dart:developer';

import 'package:get/get.dart';

import 'home_controller.dart';
import '../core/class/status_request.dart';
import '../core/functions/handle_response_status.dart';
import '../data/data_source/remote/items_data.dart';
import '../data/model/category.dart';
import '../data/model/item.dart';

class ItemsController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<Item> items = <Item>[].obs;
  RxInt selectedCategoryIndex = 0.obs;

  ItemsData itemsData = ItemsData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.error.obs;

  RxList<Item> selectedCategoryItems = <Item>[].obs;

  @override
  void onInit() {
    initializeController();
    super.onInit();
  }

  void initializeController() async {
    statusRequest.value = StatusRequest.loading;
    await getItems();

    if (Get.arguments != null) {
      var args = Get.arguments;
      if (args['categories'] != null) {
        categories.value = Get.arguments['categories'];
      }
      if (args['selectedCategory'] != null) {
        selectedCategoryIndex.value = Get.arguments['selectedCategory'];
      }
    }
    filterCategoryItems(selectedCategoryIndex.value);
  }

  getItems() async {
    var response = await itemsData.postData(HomeController.id!);
    statusRequest.value = handleResponseStatus(response);

    if (statusRequest.value == StatusRequest.success) {
      List itemsList = response['items'] as List;
      items.value = itemsList.map((item) => Item.fromJson(item)).toList();
    } else {
      statusRequest.value = StatusRequest.failure;
    }
  }

  void changeSelectedCategory(int newIndex) {
    selectedCategoryIndex.value = newIndex;
    filterCategoryItems(newIndex);
  }

  void filterCategoryItems(int categoryIndex) {
    int? selectedCategoryId = categories[categoryIndex].categoryId;
    selectedCategoryItems.value = items
        .where((Item item) => item.itemCategoryId == selectedCategoryId)
        .toList();
  }
}

import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handle_response_status.dart';
import '../core/services/services.dart';
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
  void onInit() async {
    statusRequest.value = StatusRequest.loading;
    await getItems();
    categories.value =
        Get.arguments != null && Get.arguments['categories'] != null
            ? Get.arguments['categories']
            : [];
    selectedCategoryIndex.value =
        Get.arguments != null && Get.arguments['categories'] != null
            ? Get.arguments['selectedCategory']
            : 0;
    filterCategoryItems(selectedCategoryIndex.value);

    super.onInit();
  }

  getItems() async {
    var response = await itemsData.postData();
    statusRequest.value = handleResponseStatus(response);

    if (statusRequest.value == StatusRequest.success) {
      for (Map<String, dynamic> item in response['data']) {
        items.add(Item.fromJson(item));
      }
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

  void toggleFavorite(MyServices myServices, int itemId) {
    bool currentValue =
        myServices.sharedPreferences.getBool('favorite-$itemId') ?? false;
    bool newValue = !currentValue;
    myServices.sharedPreferences.setBool('favorite-$itemId', newValue);
    update();
  }
}

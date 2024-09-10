import 'package:get/get.dart';

import '../data/model/category.dart';
import '../data/model/item.dart';

class ItemsController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<Item> items = <Item>[].obs;
  RxInt selectedCategoryIndex = 0.obs;

  RxList<Item> selectedCategoryItems = <Item>[].obs;

  @override
  void onInit() {
    categories.value = Get.arguments['categories'];
    selectedCategoryIndex.value = Get.arguments['selectedCategory'];
    items.value = Get.arguments['items'];
    filterCategoryItems(selectedCategoryIndex.value);

    super.onInit();
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

import 'package:get/get.dart';

import '../data/model/category.dart';

class ItemsController extends GetxController {
  List<Category>? categories;
  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    categories = Get.arguments['categories'];
    selectedCategoryIndex.value = Get.arguments['selectedCategory'];
    super.onInit();
  }

  changeSelectedCategory(int newIndex) {
    selectedCategoryIndex.value = newIndex;
    update();
  }
}

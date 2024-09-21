import 'package:get/get.dart';

import '../data/model/item.dart';

class ItemDetailsController extends GetxController {
  late Item item;
  RxInt selectedQuantity = 1.obs;

  void increase() {
    selectedQuantity.value++;
  }

  void decrease() {
    if (selectedQuantity.value > 1) {
      selectedQuantity.value--;
    }
  }

  @override
  void onInit() {
    item = Get.arguments['item'];

    super.onInit();
  }
}

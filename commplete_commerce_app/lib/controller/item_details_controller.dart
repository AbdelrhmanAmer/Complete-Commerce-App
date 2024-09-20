import 'package:get/get.dart';

import '../data/model/item.dart';

class ItemDetailsController extends GetxController{
  late Item item;

  @override
  void onInit() {
    item = Get.arguments['item'];

    super.onInit();
  }
}
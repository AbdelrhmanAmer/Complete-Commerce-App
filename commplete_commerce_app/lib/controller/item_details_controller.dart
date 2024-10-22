import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handle_response_status.dart';
import '../core/services/user_service.dart';
import '../data/data_source/remote/cart_data.dart';
import '../data/model/item/base_item.dart';
import '../data/model/user.dart';

class ItemDetailsController extends GetxController {
  late BaseItem item;

  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;
  UserService userService = Get.find();
  late User user;

  void increase() {
    item.selectedQuantity++;
    update();
  }

  void decrease() {
    if (item.selectedQuantity > 1) {
      item.selectedQuantity--;
      update();
    }
  }

  addToCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addToCart(
      userId: user.id!,
      itemId: item.itemId!,
      quantity: item.selectedQuantity,
      pricePerUnit:
          item.itemPrice! - item.itemPrice! * (item.itemDiscount! / 100),
    );

    statusRequest = handleResponseStatus(response);
    update();
  }


  @override
  void onInit() {
    item = Get.arguments['item'];
    user = userService.user.value!;

    super.onInit();
  }
}

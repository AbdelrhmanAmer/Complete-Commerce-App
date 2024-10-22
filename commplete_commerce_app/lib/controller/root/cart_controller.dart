import 'package:get/get.dart';

import '../../data/model/item/cartItem.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/services/user_service.dart';
import '../../data/data_source/remote/cart_data.dart';
import '../../data/model/user.dart';

class Cart extends GetxController {
  List<CartItem> cartItems = [];
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;
  UserService userService = Get.find();
  late User user;

  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.getCartItems(userId: user.id!);
    _processCartItems(response['cartItems']);
    statusRequest = handleResponseStatus(response);
    update();
  }

  _processCartItems(List<dynamic> items) {
    cartItems.addAll(items.map((item) => CartItem.fromJson(item)));
    update();
  }

  @override
  void onInit() {
    user = userService.user.value!;
    getCartItems();
    super.onInit();
  }
}

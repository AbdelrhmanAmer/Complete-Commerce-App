import 'package:get/get.dart';

import '../../data/model/item/base_item.dart';
import '../../data/model/item/cartItem.dart';
import '../../core/class/status_request.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/services/user_service.dart';
import '../../data/data_source/remote/cart_data.dart';
import '../../data/model/user.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];
  CartData cartData = CartData(Get.find());
  double subtotal = 0.0;
  double VAT = 5;
  StatusRequest statusRequest = StatusRequest.error;
  UserService userService = Get.find();
  late User user;

  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.getCartItems(userId: user.id!);
    _processCartItems(response['cartItems']);
    calcSubtotal();
    statusRequest = handleResponseStatus(response);
    update();
  }

  increase(Item item) {
    item.selectedQuantity++;
    update();
    cartData.updateItemQuantity(
      userId: user.id!,
      itemId: item.itemId!,
      newQuantity: item.selectedQuantity,
      discount: item.itemDiscount!,
      price: item.itemPrice!,
    );
    subtotal += item.discountedPrice;
    update();
  }

  decrease(Item item) {
    if (item.selectedQuantity > 1) {
      item.selectedQuantity--;
      subtotal -= item.discountedPrice;
      update();
      cartData.updateItemQuantity(
        userId: user.id!,
        itemId: item.itemId!,
        newQuantity: item.selectedQuantity,
        price: item.itemPrice!,
        discount: item.itemDiscount!,
      );
    }
  }

  void calcSubtotal() {
    subtotal = cartItems.fold(0.0, (sum, item) {
      double price =
          item.itemPrice! - item.itemPrice! * (item.itemDiscount! / 100);
      int quantity = item.selectedQuantity;
      return sum + (price * quantity);
    });
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

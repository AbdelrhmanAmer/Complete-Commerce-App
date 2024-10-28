import '../../../core/class/crud.dart';
import '../../../app_links.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  getCartItems({
    required String userId,
  }) async {
    var response = await crud.postData(AppLinks.getCartItems, {
      'user_id': userId,
    });
    return response;
  }

  addToCart({
    required String userId,
    required String itemId,
    required int quantity,
    required double price,
    required double discount,
  }) async {
    double pricePerUnit = price - price * (discount / 100);
    double totalPrice = quantity * pricePerUnit;
    var response = await crud.postData(AppLinks.addToCart, {
      'user_id': userId,
      'item_id': itemId,
      'quantity': quantity,
      'pricePerUnit': pricePerUnit,
      'totalPrice': totalPrice,
    });
    return response;
  }

  deleteFromCart({
    required String userId,
    required String itemId,
  }) async {
    var response = await crud.postData(AppLinks.deleteFromCart, {
      'user_id': userId,
      'item_id': itemId,
    });
    return response;
  }

  updateItemQuantity({
    required String userId,
    required String itemId,
    required int newQuantity,
    required double price,
    required double discount,
  }) async {
    double pricePerUnit = price - price * (discount / 100);
    double totalPrice = newQuantity * pricePerUnit;
    var response = await crud.postData(AppLinks.updateItemQuantity, {
      'user_id': userId,
      'item_id': itemId,
      'quantity': newQuantity,
      'totalPrice': totalPrice,
    });
    return response;
  }
}

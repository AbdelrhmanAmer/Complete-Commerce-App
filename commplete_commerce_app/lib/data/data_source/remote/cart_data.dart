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
    required double pricePerUnit,
  }) async {
    var response = await crud.postData(AppLinks.addToCart, {
      'user_id': userId,
      'item_id': itemId,
      'quantity': quantity,
      'price_per_unit': pricePerUnit,
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
  }) async {
    var response = await crud.postData(AppLinks.updateItemQuantity, {
      'user_id': userId,
      'item_id': itemId,
      'quantity': newQuantity,
    });
    return response;
  }
}

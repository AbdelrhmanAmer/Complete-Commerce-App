import 'base_item.dart';
import 'item.dart';

class CartItem extends BaseItem {
  String? cartId;
  String? cartUserId;
  String? cartItemId;
  String? cartItemQuantity;
  String? pricePerUnit;
  String? totalPrice;
  String? addedAt;
  String? updatedAt;

  CartItem({
    this.cartId,
    this.cartUserId,
    this.cartItemId,
    this.cartItemQuantity,
    this.pricePerUnit,
    this.totalPrice,
    this.addedAt,
    this.updatedAt,
    String? itemId,
    String? itemName,
    String? itemArabicName,
    String? itemDescription,
    String? itemArabicDescription,
    String? itemImage,
    int? itemQuantity,
    int? itemActive,
    double? itemPrice,
    int? itemDiscount,
    double? itemRate,
    String? itemBrand,
    String? itemDatetime,
    String? itemCategoryId,
  }) : super() {
    this.itemId = itemId;
    this.itemName = itemName;
    this.itemArabicName = itemArabicName;
    this.itemDescription = itemDescription;
    this.itemArabicDescription = itemArabicDescription;
    this.itemImage = itemImage;
    this.itemQuantity = itemQuantity;
    this.itemActive = itemActive;
    this.itemPrice = itemPrice;
    this.itemDiscount = itemDiscount;
    this.itemRate = itemRate;
    this.itemBrand = itemBrand;
    this.itemDatetime = itemDatetime;
    this.itemCategoryId = itemCategoryId;
  }

  CartItem.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    cartId = json['cart_id'];
    cartUserId = json['cart_userId'];
    cartItemId = json['cart_itemId'];
    cartItemQuantity = json['cart_itemQuantity'];
    pricePerUnit = json['price_per_unit'];
    totalPrice = json['total_price'];
    addedAt = json['added_at'];
    updatedAt = json['updated_at'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['cart_id'] = cartId;
    data['cart_userId'] = cartUserId;
    data['cart_itemId'] = cartItemId;
    data['cart_itemQuantity'] = cartItemQuantity;
    data['price_per_unit'] = pricePerUnit;
    data['total_price'] = totalPrice;
    data['added_at'] = addedAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static CartItem fromItem(Item item) {
    return CartItem(
      itemId: item.itemId,
      itemName: item.itemName,
      itemArabicName: item.itemArabicName,
      itemDescription: item.itemDescription,
      itemArabicDescription: item.itemArabicDescription,
      itemImage: item.itemImage,
      itemQuantity: item.itemQuantity,
      itemActive: item.itemActive,
      itemPrice: item.itemPrice,
      itemDiscount: item.itemDiscount,
      itemRate: item.itemRate,
      itemBrand: item.itemBrand,
      itemDatetime: item.itemDatetime,
      itemCategoryId: item.itemCategoryId,
      cartItemId: item.itemId,
    );
  }
}

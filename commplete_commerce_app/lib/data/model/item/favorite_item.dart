import 'base_item.dart';

class FavoriteItem extends Item {
  String? favoriteId;
  String? favoriteUserId;
  String? favoriteItemId;
  String? userId;

  FavoriteItem({
    this.favoriteId,
    this.favoriteUserId,
    this.favoriteItemId,
    this.userId,
    String? itemId,
    String? itemName,
    String? itemArabicName,
    String? itemDescription,
    String? itemArabicDescription,
    String? itemImage,
    String? itemQuantity,
    String? itemActive,
    double? itemPrice,
    double? itemDiscount,
    String? itemRate,
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

  FavoriteItem.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_userId'];
    favoriteItemId = json['favorite_itemId'];
    userId = json['user_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['favorite_id'] = favoriteId;
    data['favorite_userId'] = favoriteUserId;
    data['favorite_itemId'] = favoriteItemId;
    data['user_id'] = userId;
    return data;
  }

  // Static method to convert Item to FavoriteItem
  static FavoriteItem fromItem(Item item) {
    return FavoriteItem(
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
      favoriteItemId: item.itemId, // Assuming itemId for favoriteItemId
    );
  }
}

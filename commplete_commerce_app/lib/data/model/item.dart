import 'package:get/get.dart';

class Item {
  int? itemId;
  String? itemName;
  String? itemArabicName;
  String? itemDescription;
  String? itemArabicDescription;
  String? itemImage;
  int? itemQuantity;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDatetime;
  int? catId;
  int? categoryId;
  String? categoryName;
  String? categoryArabicName;
  String? categoryImage;
  String? categoryDatetime;
  RxBool? isFavorite = false.obs;

  Item(
      {this.itemId,
      this.itemName,
      this.itemArabicName,
      this.itemDescription,
      this.itemArabicDescription,
      this.itemImage,
      this.itemQuantity,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDatetime,
      this.catId,
      this.categoryId,
      this.categoryName,
      this.categoryArabicName,
      this.categoryImage,
      this.categoryDatetime,
      this.isFavorite});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemArabicName = json['item_arabic_name'];
    itemDescription = json['item_description'];
    itemArabicDescription = json['item_arabic_description'];
    itemImage = json['item_image'];
    itemQuantity = json['item_quantity'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDatetime = json['item_datetime'];
    catId = json['cat_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryArabicName = json['category_arabic_name'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_arabic_name'] = itemArabicName;
    data['item_description'] = itemDescription;
    data['item_arabic_description'] = itemArabicDescription;
    data['item_image'] = itemImage;
    data['item_quantity'] = itemQuantity;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_datetime'] = itemDatetime;
    data['cat_id'] = catId;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_arabic_name'] = categoryArabicName;
    data['category_image'] = categoryImage;
    data['category_datetime'] = categoryDatetime;
    return data;
  }

  toggleFavorite() {
    isFavorite!.value = !isFavorite!.value;
  }
}

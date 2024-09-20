import 'package:get/get.dart';

import '../../core/services/services.dart';

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
  String? itemRate;
  String? itemBrand;
  int? itemCategoryId;
  int? categoryId;
  String? categoryName;
  String? categoryArabicName;
  String? categoryImage;
  String? categoryDatetime;
  RxBool isFavorite = false.obs; 

  Item({
    this.itemId,
    this.itemName,
    this.itemArabicName,
    this.itemDescription,
    this.itemArabicDescription,
    this.itemImage,
    this.itemQuantity,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemRate,
    this.itemBrand,
    this.itemDatetime,
    this.itemCategoryId,
    this.categoryId,
    this.categoryName,
    this.categoryArabicName,
    this.categoryImage,
    this.categoryDatetime,
  }) {
    MyServices myServices = Get.find();
    bool? favoriteStatus = myServices.sharedPreferences.getBool('favorite-$itemId');
    isFavorite.value = favoriteStatus ?? false; 
  }

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
    itemRate = json['item_rate'];
    itemBrand = json['item_brand'];
    itemDatetime = json['item_datetime'];
    itemCategoryId = json['item_categoryId'];
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
    data['item_rate'] = itemRate;
    data['item_brand'] = itemBrand;
    data['item_discount'] = itemDiscount;
    data['item_datetime'] = itemDatetime;
    data['item_categoryId'] = itemCategoryId;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_arabic_name'] = categoryArabicName;
    data['category_image'] = categoryImage;
    data['category_datetime'] = categoryDatetime;
    return data;
  }


}

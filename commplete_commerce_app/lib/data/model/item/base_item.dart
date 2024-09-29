abstract class BaseItem {
  String? itemId;
  String? itemName;
  String? itemArabicName;
  String? itemDescription;
  String? itemArabicDescription;
  String? itemImage;
  int? itemQuantity;
  int? itemActive;
  double? itemPrice;
  int? itemDiscount;
  double? itemRate;
  String? itemBrand;
  String? itemDatetime;
  String? itemCategoryId;

  BaseItem();

  BaseItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemArabicName = json['item_arabic_name'];
    itemDescription = json['item_description'];
    itemArabicDescription = json['item_arabic_description'];
    itemImage = json['item_image'];
    itemQuantity = int.tryParse(json['item_quantity']);
    itemActive = int.tryParse(json['item_active']);
    itemPrice = double.tryParse(json['item_price']);
    itemDiscount = int.tryParse(json['item_discount']);
    itemRate = double.tryParse(json['item_rate']);
    itemBrand = json['item_brand'];
    itemDatetime = json['item_datetime'];
    itemCategoryId = json['item_categoryId'];
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
    data['item_rate'] = itemRate;
    data['item_brand'] = itemBrand;
    data['item_datetime'] = itemDatetime;
    data['item_categoryId'] = itemCategoryId;
    return data;
  }
}

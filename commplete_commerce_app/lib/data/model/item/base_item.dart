class Item {
  String? itemId;
  String? itemName;
  String? itemArabicName;
  String? itemDescription;
  String? itemArabicDescription;
  String? itemImage;
  String? itemQuantity;
  String? itemActive;
  double? itemPrice;
  double? itemDiscount;
  String? itemRate;
  String? itemBrand;
  String? itemDatetime;
  String? itemCategoryId;
  String? categoryId;
  String? categoryName;
  String? categoryArabicName;
  String? categoryImage;
  String? categoryDatetime;
  String? favorite;
  double discountedPrice = 0.0;
  int selectedQuantity = 1;

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
      this.itemRate,
      this.itemBrand,
      this.itemDatetime,
      this.itemCategoryId,
      this.categoryId,
      this.categoryName,
      this.categoryArabicName,
      this.categoryImage,
      this.categoryDatetime,
      this.favorite});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemArabicName = json['item_arabic_name'];
    itemDescription = json['item_description'];
    itemArabicDescription = json['item_arabic_description'];
    itemImage = json['item_image'];
    itemQuantity = json['item_quantity'];
    itemActive = json['item_active'];
    itemPrice = double.tryParse(json['item_price']) ?? 0.0;
    itemDiscount = double.tryParse(json['item_discount']) ?? 0.0;
    itemRate = json['item_rate'];
    itemBrand = json['item_brand'];
    itemDatetime = json['item_datetime'];
    itemCategoryId = json['item_categoryId'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryArabicName = json['category_arabic_name'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
    favorite = json['favorite'];

    double price = itemPrice ?? 0.0;
    double discount = itemDiscount ?? 0.0;
    discountedPrice = price - (price * (discount / 100));
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
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_arabic_name'] = categoryArabicName;
    data['category_image'] = categoryImage;
    data['category_datetime'] = categoryDatetime;
    data['favorite'] = favorite;
    return data;
  }
}

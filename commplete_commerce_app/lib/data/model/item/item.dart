import 'base_item.dart';

class Item extends BaseItem {
  int? categoryId;
  String? categoryName;
  String? categoryArabicName;
  String? categoryImage;
  String? categoryDatetime;
  bool? favorite;

  Item(
      {this.categoryId,
      this.categoryName,
      this.categoryArabicName,
      this.categoryImage,
      this.categoryDatetime,
      this.favorite});

  Item.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    categoryId = int.tryParse(json['category_id']);
    categoryName = json['category_name'];
    categoryArabicName = json['category_arabic_name'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
    favorite = json['favorite'] == "1" ? true : false;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_arabic_name'] = categoryArabicName;
    data['category_image'] = categoryImage;
    data['category_datetime'] = categoryDatetime;
    data['favorite'] = favorite;
    return data;
  }

}

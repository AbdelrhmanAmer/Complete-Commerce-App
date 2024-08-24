class Category {
  int? categoryId;
  String? categoryName;
  String? categoryArabicName;
  String? categoryImage;
  String? categoryDatetime;

  Category(
      {this.categoryId,
      this.categoryName,
      this.categoryArabicName,
      this.categoryImage,
      this.categoryDatetime});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryArabicName = json['category_arabic_name'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_arabic_name'] = categoryArabicName;
    data['category_image'] = categoryImage;
    data['category_datetime'] = categoryDatetime;
    return data;
  }
}

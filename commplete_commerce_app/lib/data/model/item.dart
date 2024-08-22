class Item {
  int? id;
  String? name;
  String? arabicName;
  String? description;
  String? arabicDescription;
  String? image;
  int? quantity;
  int? active;
  int? price;
  int? discount;
  String? datetime;
  int? categoryId;

  Item(
      {this.id,
      this.name,
      this.arabicName,
      this.description,
      this.arabicDescription,
      this.image,
      this.quantity,
      this.active,
      this.price,
      this.discount,
      this.datetime,
      this.categoryId});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabicName = json['arabic_name'];
    description = json['description'];
    arabicDescription = json['arabic_description'];
    image = json['image'];
    quantity = json['quantity'];
    active = json['active'];
    price = json['price'];
    discount = json['discount'];
    datetime = json['datetime'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['arabic_name'] = arabicName;
    data['description'] = description;
    data['arabic_description'] = arabicDescription;
    data['image'] = image;
    data['quantity'] = quantity;
    data['active'] = active;
    data['price'] = price;
    data['discount'] = discount;
    data['datetime'] = datetime;
    data['category_id'] = categoryId;
    return data;
  }
}

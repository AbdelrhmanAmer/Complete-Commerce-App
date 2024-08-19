class Category {
  int? id;
  String? name;
  String? arabicName;
  String? image;
  String? datetime;

  Category(
      {this.id, this.name, this.arabicName, this.image, this.datetime});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabicName = json['arabic_name'];
    image = json['image'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['arabic_name'] = arabicName;
    data['image'] = image;
    data['datetime'] = datetime;
    return data;
  }
}
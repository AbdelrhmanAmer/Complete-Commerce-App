import 'dart:developer';

class User {
  String? id;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? otp;
  String? createDate;

  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.otp,
      this.createDate});

  factory User.fromJson(Map<String, dynamic> json) {
    log('User Model- json: ${json.toString()}');
    return User(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['user_name'] = username;
    data['user_email'] = email;
    data['user_password'] = password;
    data['user_phone'] = phone;
    data['user_address'] = address;
    data['user_otp'] = otp;
    data['user_create'] = createDate;
    return data;
  }
}

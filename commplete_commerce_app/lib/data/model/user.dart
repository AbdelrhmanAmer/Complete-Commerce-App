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
      this.otp,
      this.createDate});

  User.fromJson(Map<String, dynamic> json) {
    id           = json['user_id'];      
    username     = json['user_name'];    
    email        = json['user_email'];   
    password     = json['user_password'];
    phone        = json['user_phone'];
    address      = json['user_address'];   
    otp          = json['user_otp'];     
    createDate   = json['user_create'];  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id']       = id;
    data['user_name']     = username;
    data['user_email']    = email;
    data['user_password'] = password;
    data['user_phone']    = phone;
    data['user_address']  = address;
    data['user_otp']      = otp;
    data['user_create']   = createDate;
    return data;
  }
}

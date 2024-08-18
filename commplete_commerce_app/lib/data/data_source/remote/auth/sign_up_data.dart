import '../../../../app_links.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String username, String password, String email, String phone, String address) async {
    var response = await crud.postData(AppLinks.signUp, {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'address': address
    });
    return response;
  }
}

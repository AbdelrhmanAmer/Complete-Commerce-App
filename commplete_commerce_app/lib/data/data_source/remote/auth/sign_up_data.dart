import '../../../../app_links.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLinks.signUp, {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
    });
    return response.fold((left) => left, (right) => right);
  }
}

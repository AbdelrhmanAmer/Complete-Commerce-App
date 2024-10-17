import '../../../../app_links.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  signUp({required String password, required String email}) async {
    var response = await crud.postData(AppLinks.signUp, {
      'password': password,
      'email': email,
    });
    return response;
  }

  setupProfile({
    required String email,
    required String username,
    required String address,
    required String phone,
  }) async {
    var response = await crud.postData(AppLinks.setupProfile, {
      'email': email,
      'username': username,
      'address': address,
      'phone': phone,
    });
    return response;
  }
}

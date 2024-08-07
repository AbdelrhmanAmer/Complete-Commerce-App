import '../../../../app_links.dart';
import '../../../../core/class/crud.dart';

class SignInData {
  Crud curd;

  SignInData(this.curd);

  postData(String email, String password) async {
    var response = await curd.postData(
      AppLinks.signIn,
      {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}

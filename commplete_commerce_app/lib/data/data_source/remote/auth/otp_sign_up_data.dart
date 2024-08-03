import '../../../../app_links.dart';
import '../../../../core/class/crud.dart';

class OtpSignUpData {
  Crud crud;

  OtpSignUpData(this.crud);

  postData(String email, otp) async {
    var response = await crud.postData(AppLinks.otp, {
      'email': email,
      'otp': otp,
    });
    return response;
  }
}

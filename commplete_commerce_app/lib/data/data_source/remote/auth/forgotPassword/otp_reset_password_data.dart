import '../../../../../app_links.dart';
import '../../../../../core/class/crud.dart';

class OtpResetPasswordData {
  Crud crud;

  OtpResetPasswordData(this.crud);

  postData(String email, String otp) async {
    var response = await crud.postData(
      AppLinks.otpResetPassword,
      {
        'email': email,
        'otp': otp,
      },
    );

    return response;
  }
}

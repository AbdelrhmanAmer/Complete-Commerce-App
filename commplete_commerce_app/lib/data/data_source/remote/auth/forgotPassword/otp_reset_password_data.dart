import '../../../../../app_links.dart';
import '../../../../../core/class/crud.dart';

class OtpResetPasswordData {
  Crud crud;

  OtpResetPasswordData(this.crud);

  checkEmailExistence(String email) async {
    var response = await crud.postData(
      AppLinks.checkEmail,
      {'email': email},
    );
    return response;
  }
  sendResetPasswordOtp(String email) async {
    var response = await crud.postData(
      AppLinks.sendResetPasswordOtp,
      {'email': email},
    );
    return response;
  }
  verifyResetOtp(String email, String otp) async {
    var response = await crud.postData(
      AppLinks.verifyResetPasswordOtp,
      {
        'email': email,
        'otp': otp,
      },
    );

    return response;
  }
  resetPassword(String email, String password) async {
    var response = await crud.postData(
      AppLinks.resetPassword,
      {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

}

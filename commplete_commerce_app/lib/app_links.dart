class AppLinks {
  // Server
  static const String server = 'http://10.0.2.2/Complete-Ecommerce';

  // Authentication
  static const String signIn = '$server/auth/sign_in.php';
  static const String signUp = '$server/auth/sign_up.php';
  static const String otp = '$server/auth/otp.php';

  // forgot password
  static const String checkEmail = '$server/auth/forgotPassword/check_email.php';
  static const String otpResetPassword = '$server/auth/forgotPassword/otp_reset_password.php';
  static const String resetPassword = '$server/auth/forgotPassword/reset_password.php';
  
}

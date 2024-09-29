class AppLinks {
  // Server
  static const String server = 'http://127.0.0.1/ecommerce-app-backend';
  // Authentication
  static const String signIn = '$server/auth/sign_in.php';
  static const String signUp = '$server/auth/sign_up.php';
  static const String otp = '$server/auth/otp.php';
  static const String resendOtp = '$server/auth/resend_otp.php';

    // forgot password
    static const String checkEmail = '$server/auth/forgotPassword/check_email.php';
    static const String otpResetPassword = '$server/auth/forgotPassword/otp_reset_password.php';
    static const String resetPassword = '$server/auth/forgotPassword/reset_password.php';

  // Images 
  static const String staticImages = '$server/upload'; 
  static const String imageCategories = '$staticImages/categories';
  static const String imageItems = '$staticImages/items';

  // Home
  static const String home = '$server/home.php';

  // Items
  static const String items = '$server/items/items.php';
  
  // Favorite Items
  static const String addFavoriteItem = '$server/favorite/add.php';
  static const String removeFavoriteItem = '$server/favorite/remove.php';
  static const String allFavoriteItems = '$server/favorite/items.php';
  
}

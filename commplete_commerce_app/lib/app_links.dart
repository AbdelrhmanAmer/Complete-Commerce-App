class AppLinks {
  // Server
  static const String server = 'http://127.0.0.1/ecommerce-app-backend';

  // Authentication
  static const String signIn = '$server/auth/sign_in.php';

  // sign up
  static const String signUp = '$server/auth/signUp/sign_up.php';
  static const String setupProfile = '$server/auth/signUp/setup_profile.php';
  static const String otp = '$server/auth/signUp/send_signup_otp.php';
  static const String resendOtp = '$server/auth/resend_otp.php';

  // forgot password
  static const String checkEmail =
      '$server/auth/forgotPassword/check_email.php';
  static const String verifyResetPasswordOtp =
      '$server/auth/forgotPassword/verify_reset_otp.php';
  static const String resetPassword =
      '$server/auth/forgotPassword/reset_password.php';
  static const String sendResetPasswordOtp =
      '$server/auth/forgotPassword/send_reset_otp.php';

  // Profile
  static const String editProfile = '$server/profile/edit_profile.php';

  // Images
  static const String staticImages = '$server/upload';
  static const String imageCategories = '$staticImages/categories';
  static const String imageItems = '$staticImages/items';

  // Home
  static const String home = '$server/home.php';

  // Items
  static const String items = '$server/items/items.php';

  // Cart
  static const String getCartItems = '$server/cart/get_items.php';
  static const String addToCart = '$server/cart/add.php';
  static const String deleteFromCart = '$server/cart/delete.php';
  static const String updateItemQuantity = '$server/cart/update.php';

  // Favorite Items
  static const String addFavoriteItem = '$server/favorite/add.php';
  static const String removeFavoriteItem = '$server/favorite/remove.php';
  static const String allFavoriteItems = '$server/favorite/items.php';
}

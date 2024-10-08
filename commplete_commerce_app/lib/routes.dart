import 'package:get/get.dart';

import 'core/constant/app_routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screens/settings/profile.dart';
import 'view/screens/settings/preferences.dart';
import 'view/screens/settings/settings.dart';
import 'view/screens/categoryItems.dart';
import 'view/screens/item_details.dart';
import 'view/screens/root_screen.dart';
import 'view/screens/language.dart';
import 'view/screens/onboarding.dart';
import 'view/screens/authentication/forgot_password/reset_password.dart';
import 'view/screens/authentication/forgot_password/otp_reset_pass.dart';
import 'view/screens/authentication/forgot_password/forgot_password.dart';
import 'view/screens/authentication/otp_sign_up.dart';
import 'view/screens/authentication/sign_in.dart';
import 'view/screens/authentication/sign_up.dart';

List<GetPage<dynamic>>? routes = [
  // Language
  GetPage(
    name: '/',
    page: () => const Language(),
    middlewares: [
      MyMiddleware(),
    ],
  ),

  // Onboarding
  GetPage(name: Routes.onBoarding, page: () => const OnBoarding()),

  // Authentication
  GetPage(name: Routes.signIn, page: () => const SignIn()),
  GetPage(name: Routes.signUp, page: () => const SignUp()),
  GetPage(name: Routes.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: Routes.otpResetPassword, page: () => const OTPResetPassword()),
  GetPage(name: Routes.otpSignUp, page: () => const OTPSignUp()),
  GetPage(name: Routes.resetPassword, page: () => const ResetPassword()),

  GetPage(name: Routes.home, page: () => const RootScreen()),
  GetPage(name: Routes.items, page: () => const CategoryItems()),
  GetPage(name: Routes.itemDetails, page: () => const ItemDetails()),

  // Settings
  GetPage(name: Routes.settings, page: () => const Settings()),
  GetPage(name: Routes.preferences, page: () => const Preferences()),
  GetPage(name: Routes.profile, page: () => const Profile()),
];

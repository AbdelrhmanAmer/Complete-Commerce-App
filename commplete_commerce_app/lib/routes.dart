import 'package:get/get.dart';

import 'core/constant/app_routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screens/language.dart';
import 'view/screens/onboarding.dart';
import 'view/screens/authentication/forgot_password/reset_password.dart';
import 'view/screens/authentication/forgot_password/otp_reset_pass.dart';
import 'view/screens/authentication/forgot_password/forgot_password.dart';
import 'view/screens/authentication/otp_sign_up.dart';
import 'view/screens/authentication/sign_in.dart';
import 'view/screens/authentication/sign_up.dart';
import 'view/screens/home.dart';

List<GetPage<dynamic>>? routes = [
  // Language
  GetPage(
    name: '/',
    page: () => const Language(),
    middlewares: [
      MyMiddleware(),
    ],
  ),

  // GetPage(name: '/', page: ()=>const Home()),

  // Onboarding
  GetPage(name: Routes.onBoarding, page: () => const OnBoarding()),

  // Authentication
  GetPage(name: Routes.signIn, page: () => const SignIn()),
  GetPage(name: Routes.signUp, page: () => const SignUp()),
  GetPage(name: Routes.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: Routes.otpResetPassword, page: () => const OTPResetPassword()),
  GetPage(name: Routes.otpSignUp, page: () => const OTPSignUp()),
  GetPage(name: Routes.resetPassword, page: () => const ResetPassword()),

  GetPage(name: Routes.home, page: () => const Home()),
];

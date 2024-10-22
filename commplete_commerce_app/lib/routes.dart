import 'package:commplete_commerce_app/view/screens/profile/edit_profile.dart';
import 'package:get/get.dart';

import 'core/constant/app_routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screens/authentication/sign_up/term_of_service.dart';
import 'view/screens/authentication/sign_up/setup_profile.dart';
import 'view/screens/authentication/forgot_password/success_reset.dart';
import 'view/screens/language.dart';
import 'view/screens/item_details.dart';
import 'view/screens/onboarding/onboarding.dart';
import 'view/screens/root/root_screen.dart';
import 'view/screens/profile/profile.dart';
import 'view/screens/settings/preferences.dart';
import 'view/screens/settings/settings.dart';
import 'view/screens/root/categoryItems.dart';
import 'view/screens/authentication/forgot_password/choose_verification_method.dart';
import 'view/screens/authentication/forgot_password/reset_password.dart';
import 'view/screens/authentication/forgot_password/otp_reset_pass.dart';
import 'view/screens/authentication/forgot_password/password_recovery.dart';
import 'view/screens/authentication/sign_up/signup_otp.dart';
import 'view/screens/authentication/sign_in.dart';
import 'view/screens/authentication/sign_up/sign_up.dart';

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
  GetPage(name: Routes.setupProfile, page: () => const SetupProfile()),
  GetPage(name: Routes.otpSignUp, page: () => const OtpSignUp()),
  GetPage(name: Routes.termOfService, page: () => const TermOfService()),

  GetPage(name: Routes.passwordRecovery, page: () => const PasswordRecovery()),
  GetPage(name: Routes.otpResetPassword, page: () => const OTPResetPassword()),
  GetPage(name: Routes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: Routes.chooseVerificationMethod,
      page: () => const ChooseVerificationMethod()),
  GetPage(
      name: Routes.successResetPassword,
      page: () => const SuccessResetPassword()),

  GetPage(name: Routes.root, page: () => const RootScreen()),
  GetPage(name: Routes.items, page: () => const CategoryItems()),
  GetPage(name: Routes.itemDetails, page: () => const ItemDetails()),

  // Settings
  GetPage(name: Routes.settings, page: () => const Settings()),
  GetPage(name: Routes.preferences, page: () => const Preferences()),
  GetPage(name: Routes.profile, page: () => const Profile()),
  GetPage(name: Routes.editProfile, page: () => const EditProfile()),
];

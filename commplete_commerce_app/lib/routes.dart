import 'package:flutter/material.dart';

import 'core/constant/app_routes.dart';
import 'view/screens/onboarding.dart';
import 'view/screens/authentication/reset_password.dart';
import 'view/screens/authentication/otp.dart';
import 'view/screens/authentication/sign_in.dart';
import 'view/screens/authentication/sign_up.dart';
import 'view/screens/authentication/forgot_password.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // Onboarding
  Routes.onBoarding: (context) => const OnBoarding(),
  
  // Authentication
  Routes.signIn: (context) => const SignIn(),
  Routes.signUp: (context) => const SignUp(),
  Routes.forgotPassword: (context) => const ForgotPassword(),
  Routes.otp: (context) => const OTP(),
  Routes.resetPassword: (context) => const ResetPassword(),
};

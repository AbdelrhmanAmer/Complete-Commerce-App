import 'package:flutter/material.dart';

import 'core/constant/app_routes.dart';
import 'view/screens/onboarding.dart';
import 'view/screens/authentication/sign_in.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.login: (context) => const LogIn(),
  Routes.onBoarding: (context) => const OnBoarding(),
};
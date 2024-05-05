import 'package:commplete_commerce_app/view/screens/onboarding.dart';
import 'package:flutter/material.dart';

import 'core/constant/app_routes.dart';
import 'view/screens/authentication/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.login: (context) => const LogIn(),
  Routes.onBoarding: (context) => const OnBoarding(),
};
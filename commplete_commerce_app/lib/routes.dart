import 'package:flutter/material.dart';

import 'core/constant/app_routes.dart';
import 'view/screens/authentication/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.login: (context) => const LogIn(),
};
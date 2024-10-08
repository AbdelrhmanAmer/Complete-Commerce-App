import 'dart:convert';

import '../services/services.dart';
import '../../data/model/user.dart';

User getSharedUser(MyServices myServices) {
  String? userJson = myServices.sharedPreferences.getString('user');
  if (userJson != null) {
    return User.fromJson(jsonDecode(userJson));
  }
  return User();
}

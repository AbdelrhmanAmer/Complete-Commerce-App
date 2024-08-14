import 'package:get/get.dart';

validateInput(String val, String type, {int min = 6, int max = 100}) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "Username must be 3-20 characters.";
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Please enter a valid email address.";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Please enter a valid phone number.";
    }
  }

  if (val.length < min) {
    return "Value must be at least $min characters.";
  }

  if (val.isEmpty) {
    return "Value cannot be empty.";
  }

  if (val.length > max) {
    return "Value cannot exceed $max characters.";
  }

}

String? validatePasswordMatch(String password, String confirmPassword) {
  if (password != confirmPassword) {
    return "Passwords do not match";
  }
  return null;
}

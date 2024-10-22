import 'package:get/get.dart';

validateInput(String val, String type, {int min = 6, int max = 100}) {
  if (val.isEmpty) {
    return "Value cannot be empty.";
  }

  if (val.length > max) {
    return "Value cannot exceed $max characters.";
  }

  if (type == 'username') {
    if (val.length < 3 || val.length > 20) {
      return "Username must be 3-20 characters.";
    } else if (!GetUtils.isUsername(val)) {
      return "Username is not valid.";
    }
  }

  if (type == 'password') {
    if (val.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(val)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(val)) {
      return 'Password must contain at least one digit';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(val)) {
      return 'Password must contain at least one special character';
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

  return null;
}

String? validatePasswordMatch(String password, String confirmPassword) {
  if (password != confirmPassword) {
    return "Passwords do not match";
  }
  return null;
}

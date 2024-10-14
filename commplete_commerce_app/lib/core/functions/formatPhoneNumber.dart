String formatPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters
  final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

  if (digits.length == 11) {
    return '+20 ${digits.substring(1, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
  } else {
    return phoneNumber;
  }
}

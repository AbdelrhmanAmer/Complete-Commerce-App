String maskPhoneNumber(String phone) {
  if (phone.length > 10) {
    final visiblePart = phone.substring(phone.length - 4, phone.length);
    final maskedPart = '*' * (phone.length - 4);

    return '+20$maskedPart$visiblePart';
  }
  return phone;
}

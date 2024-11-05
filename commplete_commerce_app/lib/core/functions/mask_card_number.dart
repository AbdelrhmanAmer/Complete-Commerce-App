String maskCardNumber(String number) {
  if (number.length == 16) {
    final visiblePart = number.substring(number.length - 4, number.length);
    final maskedPart = '*' * 12;

    return '${maskedPart.substring(0, 4)} ${maskedPart.substring(4, 8)} ${maskedPart.substring(8, 12)} $visiblePart';
  }
  return number;
}

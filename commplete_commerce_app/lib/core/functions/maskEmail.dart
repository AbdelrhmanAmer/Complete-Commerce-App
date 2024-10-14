String maskEmail(String email){
  final emailParts = email.split('@');

  if(emailParts.length == 2){
    final localPart = emailParts[0];
    final domain = emailParts[1];

    final visibleParts = localPart.length > 3 ?  localPart.substring(0, 3) : localPart;
    final maskedPart = '*' * (localPart.length - visibleParts.length);

    return '$visibleParts$maskedPart$domain';
  }
  return email;

}
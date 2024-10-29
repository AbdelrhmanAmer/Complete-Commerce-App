import 'package:get/get.dart';

class PaymentMethodsController extends GetxController {
  int selectedIndex = 0;

  List<Map<String, dynamic>> methods = [
    {
      'title': 'Pay with card',
      'imagePath': 'assets/icons/card.svg',
    },
    {
      'title': 'Pay with cash',
      'imagePath': 'assets/icons/Cash.svg',
    },
    {
      'title': 'Use credit',
      'imagePath': 'assets/icons/card.svg',
    },
  ];
  List methodsScreens = [

  ] ;
  selectMethod(int index) {
    selectedIndex = index;
    update();
  }
}

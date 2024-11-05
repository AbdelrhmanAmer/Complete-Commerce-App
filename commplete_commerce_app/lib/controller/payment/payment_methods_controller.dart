import 'package:commplete_commerce_app/view/screens/payment/pay_with_card.dart';
import 'package:flutter/material.dart';
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
  List<Widget> methodsScreens = [
    const PayWithCard(),

  ] ;
  selectMethod(int index) {
    selectedIndex = index;
    update();
  }
}

import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardController extends GetxController{
  List<Widget> myCards = [

  ];

  goToAddNewCard(){
    Get.toNamed(Routes.addNewCard);
  }
}
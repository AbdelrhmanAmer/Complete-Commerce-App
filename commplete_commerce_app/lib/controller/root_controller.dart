import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/home.dart';

class RootController extends GetxController{
  int currentPageIndex = 0;

  List<Widget> pageList = [
    const Home(),
    const Center(child: Text('Categories', style:TextStyle(fontSize: 30))),
    const Center(child: Text('Cart', style:TextStyle(fontSize: 30))),
    const Center(child: Text('Profile', style:TextStyle(fontSize: 30))),
  ];

  changePage(int i){
    currentPageIndex = i;
    update();
  }
}
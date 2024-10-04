import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/settings.dart';
import '../view/screens/favorites.dart';
import '../view/screens/home.dart';

class RootController extends GetxController {
  int currentPageIndex = 0;

  List<Widget> pageList = [
    const Home(),
    const Center(child: Text('Categories', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Cart', style: TextStyle(fontSize: 20))),
    const Favorites(),
    const Settings(),
  ];

  changePage(int i) {
    currentPageIndex = i;
    update();
  }
}

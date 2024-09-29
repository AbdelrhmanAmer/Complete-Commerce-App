import 'package:flutter/material.dart';

import '../../../controller/root_controller.dart';
import '../../../core/constant/color.dart';


class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    super.key,
    required this.controller,
  });

  final RootController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: AppColor.primaryColor,
      currentIndex: controller.currentPageIndex,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (int pageIndex) {
        controller.changePage(pageIndex);
      },
    );
  }
}

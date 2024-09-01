import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../controller/root_controller.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootController());

    return GetBuilder<RootController>(
      builder: ((controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
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
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: AppColor.primaryColor,
            currentIndex: controller.currentPageIndex,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: (int pageIndex){
              controller.changePage(pageIndex);
            },
          ),
          body: controller.pageList.elementAt(controller.currentPageIndex),
        );
      }),
    );
  }
}

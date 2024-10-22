import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/favorite_icon_button.dart';
import '../widgets/item_details.dart/custom_bottom_navbar.dart';
import '../widgets/item_details.dart/item_details_body.dart';
import '../../controller/item_details_controller.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsController controller = Get.put(ItemDetailsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black26 : const Color(0xFFf0f0f0),
        appBar: AppBar(
          elevation: 0,
          actions: [
            FavoriteIconButton(item: controller.item),
            const SizedBox(width: 20),
          ],
        ),
        body: const ItemDetailsBody(),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}

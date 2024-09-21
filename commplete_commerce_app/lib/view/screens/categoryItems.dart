import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../widgets/categoryItems/item_tile.dart';
import '../widgets/categoryItems/items_appbar.dart';
import '../widgets/categories_list.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());

    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ItemsAppbar(),
            const SizedBox(height: 10),
            Obx(
              () => CategoriesList(
                categories: controller.categories,
                selectedCategoryIndex: controller.selectedCategoryIndex.value,
                onPress: (index) {
                  controller.changeSelectedCategory(index);
                },
                hasImage: false,
              ),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.selectedCategoryItems.length,
                    itemBuilder: (ctx, index) {
                      return ItemTile(
                          item: controller.selectedCategoryItems[index]);
                    })))
          ],
        ),
      ),
    ));
  }
}

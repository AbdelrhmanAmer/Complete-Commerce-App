import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/root/favorite_controller.dart';
import '../../../controller/category_items_controller.dart';
import '../../widgets/root_appbar.dart';
import '../../widgets/categoryItems/item_tile.dart';
import '../../widgets/categories_list.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryItemsController());
    Get.put(FavoriteController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        appBar: appBar(context,
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            GetBuilder<CategoryItemsController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CategoriesList(
                    categories: controller.categories,
                    selectedCategoryIndex: controller.selectedIndex,
                    onPress: (index) {
                      controller.changeSelectedCategory(index);
                    },
                    hasImage: false,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GetBuilder<CategoryItemsController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.selectedCategoryItems.length,
                    itemBuilder: (ctx, index) {
                      return ItemTile(
                          item: controller.selectedCategoryItems[index],
                          statusRequest: controller.statusRequest,
                          onPress: () => controller.goToItemsDetailsScreen(
                              controller.selectedCategoryItems[index]));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/root/favorite_controller.dart';
import '../../widgets/categoryItems/item_tile.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: GetBuilder<FavoriteController>(
                    builder: (controller) {
                      if (controller.favoriteItems.isEmpty) {
                        return Center(
                          child: Text(
                            'No favorite items yet!',
                            style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: controller.favoriteItems.length,
                        itemBuilder: (ctx, index) {
                          return ItemTile(
                              item: controller.favoriteItems[index],
                              statusRequest: controller.statusRequest,
                              onPress: () => controller.goToItemsDetailsScreen(
                                  controller.favoriteItems[index]));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}

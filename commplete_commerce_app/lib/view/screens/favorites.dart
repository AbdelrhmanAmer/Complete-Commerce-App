import 'dart:developer';

import 'package:commplete_commerce_app/view/widgets/favorites/favorite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/constant/app_routes.dart';
import '../widgets/categoryItems/items_appbar.dart';
import '../widgets/categoryItems/item_tile.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                const FavoriteAppBar(),
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

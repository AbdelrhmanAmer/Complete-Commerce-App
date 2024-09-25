import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/home_controller.dart';
import '../../data/model/item.dart';
import 'conditional_icon_button.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (favController) {
      final itemId = item.itemId;
      final isFavorite = favController.isFavorite[item.itemId] ?? false;
      final userId = int.parse(HomeController.id!);

      return ConditionalIconButton(
        trueCondition: isFavorite,
        falseColor: Theme.of(context).colorScheme.onSurface,
        onPress: () {
          favController.toggleFavorite(item.itemId!);
          if (favController.isFavorite[itemId]!) {
            favController.addFavoriteItem(userId, item.itemId!);
          } else {
            favController.removeFavoriteItem(userId, item.itemId!);
          }
        },
        iconSize: 18,
        height: 28,
      );
    });
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/root/favorite_controller.dart';
import '../../data/model/item/base_item.dart';
import 'conditional_icon_button.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (favController) {
        bool? isFavorite;
        String itemId = item.itemId!;
        isFavorite =
            favController.favoriteItems.any((item) => item.itemId == itemId);
        return ConditionalIconButton(
          trueCondition: isFavorite,
          falseColor: Theme.of(context).colorScheme.onSurface,
          onPress: () {
            favController.toggleFavorite(item);
          },
          iconSize: 20,
          height: 28,
        );
      },
    );
  }
}

import 'package:commplete_commerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/services/services.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/constants.dart';
import '../../../data/model/item.dart';
import '../home/favorite_icon_button.dart';

class ItemTile extends GetView<ItemsController> {
  const ItemTile({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          controller.statusRequest.value == StatusRequest.loading
              ? const CircularProgressIndicator()
              : ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    'assets/images/${item.itemImage}',
                    fit: BoxFit.fitHeight,
                    width: size.width * .15,
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  title: Text(
                    'EGP ${NumberFormat('#,##0').format(item.itemPrice! * (1 - item.itemDiscount! / 100))}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        '${item.itemName}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${item.itemDescription}',
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  style: ListTileStyle.list,
                  tileColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
          Positioned(
            right: 5,
            top: 3,
            child: FavoriteIconButton(
              isFavorite: myServices.sharedPreferences
                      .getBool('favorite-${item.itemId}') ??
                  false,
              onPress: () =>
                  controller.toggleFavorite(myServices, item.itemId!),
            ),
          )
        ],
      ),
    );
  }
}

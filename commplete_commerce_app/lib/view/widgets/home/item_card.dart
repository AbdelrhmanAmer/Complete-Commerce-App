import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../data/model/item.dart';
import 'favorite_icon_button.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    required this.onPress,
  });
  final Item item;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    bool hasDicount = item.itemDiscount! <= 0.0 ? false : true;

    return InkWell(
      onTap: onPress,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                fit: BoxFit.fitWidth,
                                'assets/images/${item.itemImage}'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.itemName!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${NumberFormat('#,##0').format(item.itemPrice! * (1 - item.itemDiscount! / 100))}',
                          style: GoogleFonts.oswald(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        hasDicount
                            ? Text('\$${NumberFormat('#,##0').format(item.itemPrice)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold))
                            : const Text('')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => FavoriteIconButton(
              isFavorite: item.isFavorite!.value,
              onPress: item.toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }
}

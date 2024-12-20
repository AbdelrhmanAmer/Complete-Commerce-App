import 'package:commplete_commerce_app/data/model/item/base_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../favorite_icon_button.dart';

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
    // Safeguard for itemDiscount
    double discount = item.itemDiscount ?? 0.0;
    bool hasDiscount = discount > 0.0;

    // Safeguard for itemPrice
    double price = item.itemPrice ?? 0.0;
    double discountedPrice = item.discountedPrice;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh
                ,borderRadius: BorderRadius.circular(15)
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          fit: BoxFit.fitWidth,
                          '${item.itemImage}',
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Spacer(flex: 1),
                  // Item name
                  Text(
                    item.itemName!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 5),
                  const Spacer(flex: 3),
                  // Item price
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Discounted Price
                        Text(
                          '\$${NumberFormat('#,##0').format(discountedPrice)}',
                          style: GoogleFonts.oswald(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        if (hasDiscount)
                          Text(
                            '\$${NumberFormat('#,##0').format(price)}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(top: 15, right: 15, child: FavoriteIconButton(item: item)),
      ],
    );
  }
}

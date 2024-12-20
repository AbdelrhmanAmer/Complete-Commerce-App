import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../small_container.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
    required this.price,
    this.itemDiscount = 0,
  });

  final double? price;
  final double? itemDiscount;

  @override
  Widget build(BuildContext context) {
    final discountedPrice = price! - price! * (itemDiscount! / 100);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (itemDiscount != 0)
          SmallContainer(
            object: '$itemDiscount%',
            backgroundColor:
                Get.isDarkMode ? Colors.amber : Colors.amber.withOpacity(.6),
            foregroundColor: Colors.black,
          ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              if (itemDiscount != 0) ...[
                TextSpan(
                  text: '\$${NumberFormat('#,##0').format(discountedPrice)}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                TextSpan(
                  text: ' - ',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
              TextSpan(
                text: '\$${NumberFormat('#,##0').format(price)}',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: itemDiscount != 0
                        ? Theme.of(context).colorScheme.surfaceContainerHighest
                        : Theme.of(context).colorScheme.onSurface,
                    decoration: itemDiscount != 0
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ],
    );
  }
}

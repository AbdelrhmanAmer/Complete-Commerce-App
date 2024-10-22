import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/root/item_details_controller.dart';
import '../custom_icon_button.dart';


class ProductRateAndShare extends StatelessWidget {
  const ProductRateAndShare({
    super.key,
    required this.controller,
  });

  final ItemDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              '${controller.item.itemRate}',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        CustomIconButton(
          iconData: Icons.share_rounded,
          onPress: () {},
          backgroundColor: Colors.transparent,
          foregroundColor:
              Theme.of(context).colorScheme.onSurface,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/item/base_item.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.item,
    required this.onPress,
  });

  final BaseItem item;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPress,
        child: Row(
          children: [
            // Container for the image
            Container(
              width: MediaQuery.of(context).size.width * .22,
              decoration: BoxDecoration(
                  color: const Color(0xFFc7bab2).withOpacity(.5),
                  borderRadius: BorderRadius.circular(15)),
              height: 85,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Image.asset(
                  'assets/images/${item.itemImage}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Padding around the column instead of its children
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                // Only padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${item.itemName}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'EGP ${NumberFormat('#,##0').format(item.itemPrice! * (1 - item.itemDiscount! / 100))}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Quantity  ${item.selectedQuantity}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    // Text(
                    //   '${item.itemDescription}',
                    //   style: Theme.of(context).textTheme.labelSmall,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

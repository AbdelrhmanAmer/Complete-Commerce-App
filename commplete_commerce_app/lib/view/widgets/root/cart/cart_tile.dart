import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/root/cart_controller.dart';
import '../../../../data/model/item/cartItem.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.item,
    required this.onPress,
  });

  final CartItem item;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    double price = item.itemPrice ?? 0.0;
    const containerHeight = 90.0;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final iconButtonStyle = IconButton.styleFrom(
      backgroundColor: primaryColor.withOpacity(.15),
      iconSize: 15,
      padding: const EdgeInsets.all(0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      minimumSize: const Size(25, 25),
    );
    final priceStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        );
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: containerHeight,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey.withOpacity(.3),
        // ),
        color: Get.isDarkMode ? primaryColor.withOpacity(.1) : primaryColor.withOpacity(.05),
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
                  color: primaryColor.withOpacity(.25),
                  borderRadius: BorderRadius.circular(10)),
              height: containerHeight,
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${item.itemName}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item.categoryName}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 4),
                        item.itemDiscount == 0
                            ? Text(
                                'EGP ${NumberFormat('#,##0').format(price)}',
                                style: priceStyle,
                              )
                            : Row(
                                children: [
                                  Text(
                                    '\$ ${NumberFormat('#,##0').format(item.discountedPrice)}',
                                    style: priceStyle,
                                  ),
                                  const SizedBox(width: 5),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        'EGP ${NumberFormat('#,##0').format(price)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: 2, // Thickness of the line
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(.4),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                      ],
                    ),
                    GetBuilder<CartController>(
                      builder: (controller) => Positioned(
                        top: 2,
                        right: 15,
                        bottom: 0,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () => controller.increase(item),
                              style: iconButtonStyle,
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '${item.selectedQuantity}',
                              style: TextStyle(color: primaryColor),
                            ),
                            const SizedBox(height: 3),
                            IconButton(
                              onPressed: () => controller.decrease(item),
                              style: iconButtonStyle,
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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

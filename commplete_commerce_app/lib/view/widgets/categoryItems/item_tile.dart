import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/constants.dart';
import '../../../data/model/item/base_item.dart';
import '../favorite_icon_button.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.onPress,
    required this.statusRequest,
  });

  final BaseItem item;
  final StatusRequest statusRequest;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10, left: 10),
      child: Stack(
        children: [
          statusRequest == StatusRequest.loading
              ? const CircularProgressIndicator()
              : ListTile(
                  onTap: onPress,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        'assets/images/${item.itemImage}',
                        fit: BoxFit.fitHeight,
                        width: size.width * .22,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EGP ${NumberFormat('#,##0').format(item.itemPrice! * (1 - item.itemDiscount! / 100))}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${item.itemName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
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
                      ),
                    ],
                  ),
                  style: ListTileStyle.list,
                  tileColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                ),
          Positioned(
            right: 7,
            top: 6,
            child: FavoriteIconButton(item: item),
          ),
        ],
      ),
    );
  }
}

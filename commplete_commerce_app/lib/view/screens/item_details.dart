import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/item_details.dart/item_price.dart';
import '../widgets/home/favorite_icon_button.dart';
import '../../controller/item_details_controller.dart';
import '../widgets/item_details.dart/label_and_value_text.dart';
import '../widgets/item_details.dart/product_rate_and_share.dart';
import '../widgets/item_details.dart/product_view.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsController controller = Get.put(ItemDetailsController());

    var boxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      color: Theme.of(context).colorScheme.surface,
    );
    const edgeInsets = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            FavoriteIconButton(
              isFavorite: controller.item.isFavorite.value,
              onPress: () {},
              iconSize: 22,
              height: 35,
              rightMargin: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProductView(),
              Container(
                decoration: boxDecoration,
                width: double.infinity,
                child: Padding(
                  padding: edgeInsets,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductRateAndShare(controller: controller),
                      const SizedBox(height: 8),
                      ItemPrice(
                        itemPrice: controller.item.itemPrice,
                        itemDiscount: controller.item.itemDiscount,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${controller.item.itemName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      LabelAndValueText(
                        label: '- Stock: ',
                        value: controller.item.itemActive == 1
                            ? 'In Stock'
                            : 'Out of stock',
                      ),
                      const SizedBox(height: 5),
                      LabelAndValueText(
                        label: '- Price: ',
                        value: '\$${controller.item.itemPrice}',
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          LabelAndValueText(
                            label: '- Brand: ',
                            value: controller.item.itemBrand,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.verified,
                            size: 15,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Color',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          ColorDot(
                            color: Colors.black,
                            onpress: () {},
                            selected: true,
                          ),
                          ColorDot(
                            color: Colors.lightBlue,
                            onpress: () {},
                          ),
                          ColorDot(
                            color: Colors.pink,
                            onpress: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    required this.onpress,
    this.selected = false,
  });
  final Color color;
  final Function() onpress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(selected ? 3 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? Colors.red : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_view.dart';
import 'color_options.dart';
import 'item_price.dart';
import 'label_and_value_text.dart';
import 'product_rate_and_share.dart';
import '../custom_button.dart';
import '../root/home/section_bar.dart';
import '../../../core/constant/constants.dart';
import '../../../controller/item_details_controller.dart';

class ItemDetailsBody extends GetView<ItemDetailsController> {
  const ItemDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
    const edgeInsets = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

    return SingleChildScrollView(
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
                    price: controller.item.itemPrice,
                    itemDiscount: controller.item.itemDiscount,
                  ),
                  const SizedBox(height: 8),
                  // Item Name
                  Text(
                    '${controller.item.itemName}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  // - Stock
                  LabelAndValueText(
                    label: '- Stock: ',
                    value: controller.item.itemActive == '1'
                        ? 'In Stock'
                        : 'Out of stock',
                  ),
                  const SizedBox(height: 5),
                  // - Price
                  LabelAndValueText(
                    label: '- Price: ',
                    value: '\$${controller.item.itemPrice}',
                  ),
                  const SizedBox(height: 5),
                  // - Brand
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
                  const ColorOptions(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withOpacity(.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('${controller.item.itemDescription}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Divider(
                      thickness: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(.5)),
                  const SizedBox(height: 15),
                  SectionBar(title: 'Reviews (199)', onPress: () {}),
                  const SizedBox(height: 10),
                  Center(
                      child: CustomButton(
                    text: 'Checkout',
                    press: () {},
                    textStyle: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.surface),
                    verticalPadding: 15,
                    width: size.width * .9,
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

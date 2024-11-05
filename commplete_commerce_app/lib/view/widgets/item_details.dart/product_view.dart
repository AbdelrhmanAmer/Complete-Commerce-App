import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/item_details_controller.dart';
import '../../../core/constant/constants.dart';
import 'image_card.dart';

class ProductView extends GetView<ItemDetailsController> {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .3,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 140,
            child: Image.asset(
              '${controller.item.itemImage}',
            ),
          ),
          Positioned(
            bottom: 6,
            left: 20,
            child: SizedBox(
              height: 65, // Set a height for the ListView
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: ImageCard(
                      selected: index == 2 ? true : false,
                      imagePath: '${controller.item.itemImage}',
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

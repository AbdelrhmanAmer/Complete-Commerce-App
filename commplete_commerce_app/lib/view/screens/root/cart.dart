import 'package:commplete_commerce_app/core/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/root/cart/cart_tile.dart';
import '../../../controller/root/cart_controller.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GetBuilder<CartController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review your order',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * .02),
              SizedBox(
                height: 298,
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (ctx, index) {
                    return CartTile(
                      item: controller.cartItems[index],
                      onPress: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

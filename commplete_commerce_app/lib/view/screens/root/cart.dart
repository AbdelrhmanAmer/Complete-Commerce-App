import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cart/order_summary.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/authentication/input_decoration.dart';
import '../../widgets/root/cart/cart_tile.dart';
import '../../../core/constant/constants.dart';
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
              // Use Expanded to allow ListView to take available space
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // Disable scrolling in ListView
                itemCount: controller.cartItems.length,
                itemBuilder: (ctx, index) {
                  return CartTile(
                    item: controller.cartItems[index],
                    onPress: () {},
                    onDismiss: (_) =>
                        controller.removeItem(controller.cartItems[index]),
                  );
                },
              ),
              SizedBox(height: size.height * .02),
              Text(
                'Your Coupon code',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * .02),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Type coupon code',
                  iconPath: 'assets/icons/Coupon.svg',
                ),
              ),
              SizedBox(height: size.height * .02),
              OrderSummary(controller: controller),
              SizedBox(height: size.height * .02),
              CustomButton(
                text: 'Continue',
                press: controller.goToPaymentMethod,
                width: size.width * .9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

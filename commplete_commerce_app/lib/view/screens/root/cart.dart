import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                shrinkWrap: true, // This allows the ListView to take only the required height
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                itemCount: controller.cartItems.length,
                itemBuilder: (ctx, index) {
                  return CartTile(
                    item: controller.cartItems[index],
                    onPress: () {},
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
              SizedBox(height: size.height * .03),
              OrderSummary(controller: controller),
              SizedBox(height: size.height * .04),
              CustomButton(text: 'Continue', press: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.controller,
  });

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 7),
          OrderDictionary(
              label: 'Subtotal',
              value: '\$${NumberFormat('#,##0').format(controller.subtotal)}'),
          const SizedBox(height: 5),
          const OrderDictionary(
              label: 'Shipping Fee', value: 'Free', valueColor: Colors.green),
          const SizedBox(height: 5),
          const OrderDictionary(label: 'Discount', value: '\$10'),
          const SizedBox(height: 5),
          const Divider(),
          OrderDictionary(
              label: 'Total(Include of VAT)',
              value: '\$${controller.subtotal + controller.VAT}'),
          const SizedBox(height: 5),
          OrderDictionary(label: 'Estimated VAT', value: '\$${controller.VAT}'),
        ],
      ),
    );
  }
}

class OrderDictionary extends StatelessWidget {
  const OrderDictionary({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: valueColor ?? Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

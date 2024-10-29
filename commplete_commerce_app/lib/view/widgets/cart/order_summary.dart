import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../controller/root/cart_controller.dart';
import 'order_label.dart';

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
          OrderLabel(
              label: 'Subtotal',
              value: '\$${NumberFormat('#,##0').format(controller.subtotal)}'),
          const SizedBox(height: 5),
          const OrderLabel(
              label: 'Shipping Fee', value: 'Free', valueColor: Colors.green),
          const SizedBox(height: 5),
          const OrderLabel(label: 'Discount', value: '\$10'),
          const SizedBox(height: 5),
          const Divider(),
          OrderLabel(
              label: 'Total(Include of VAT)',
              value:
                  '\$${NumberFormat('#,##0').format(controller.subtotal + controller.VAT)}'),
          const SizedBox(height: 5),
          OrderLabel(label: 'Estimated VAT', value: '\$${controller.VAT}'),
        ],
      ),
    );
  }
}
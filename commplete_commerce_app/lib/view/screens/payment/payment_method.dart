import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'pay_with_card.dart';
import '../../../core/constant/color.dart';
import '../../../controller/payment/payment_methods_controller.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentMethodsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<PaymentMethodsController>(
          builder: (controller) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.methods.length,
                    itemBuilder: (ctx, index) {
                      return tabWidget(
                        context,
                        label: controller.methods[index]['title'],
                        iconPath: controller.methods[index]['imagePath'],
                        isSelected: controller.selectedIndex == index,
                        onTap: () => controller.selectMethod(index),
                      );
                    },
                  ),
                ),
              ),
              PayWithCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabWidget(
    BuildContext context, {
    required String label,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    Color selectedColor = Theme.of(context).colorScheme.onSecondaryContainer;
    Color unselectedColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey,
            ),
            color: isSelected ? AppColor.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 21,
                height: 21,
                colorFilter: ColorFilter.mode(isSelected ?selectedColor : unselectedColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSelected ?selectedColor : unselectedColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../controller/item_details_controller.dart';
import '../../../core/constant/constants.dart';
import '../custom_button.dart';
import '../custom_icon_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double padding = 15;
    var borderRadius = BorderRadius.only(
      topLeft: Radius.circular(padding),
      topRight: Radius.circular(padding),
    );

    return Material(
      elevation: 15,
      borderRadius: borderRadius,
      child: Container(
        height: size.height * .08,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: borderRadius),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder<ItemDetailsController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CustomIconButton(
                        iconData: Icons.remove, onPress: controller.decrease),
                    const SizedBox(width: 10),
                    Text('${controller.item.selectedQuantity}'),
                    const SizedBox(width: 10),
                    CustomIconButton(
                      iconData: Icons.add,
                      onPress: controller.increase,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              controller.statusRequest == StatusRequest.loading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      text: 'Add To Bag',
                      press: controller.addToCart,
                      iconPath: 'assets/icons/Bag.svg',
                      width: size.width * .4,
                      verticalPadding: 17,
                      horizontalPadding: 20,
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

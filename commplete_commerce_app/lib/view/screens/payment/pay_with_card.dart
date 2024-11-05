import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/payment/card_controller.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/custom_button.dart';

class PayWithCard extends StatelessWidget {
  const PayWithCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CardController>(
          builder: (controller) => Column(
            children: [
              CustomButton(
                text: 'Add new card',
                press: controller.goToAddNewCard,
                iconPath: 'assets/icons/Newcard.svg',
                foregroundColor: onSurfaceColor,
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                borderColor: Colors.grey.withOpacity(.5),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

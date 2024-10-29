import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/payment/visa_card.dart';

class PayWithCard extends StatelessWidget {
  const PayWithCard({super.key});

  @override
  Widget build(BuildContext context) {
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomButton(
              text: 'Add new card',
              press: () {},
              iconPath: 'assets/icons/Newcard.svg',
              foregroundColor: onSurfaceColor,
              backgroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              borderColor: Colors.grey.withOpacity(.5),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            VisaCard(visaNumber: '**** **** **** 1234', onPress: () {}),
          ],
        ),
      ),
    );
  }
}

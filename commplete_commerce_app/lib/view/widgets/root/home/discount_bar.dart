import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/color.dart';
import '../../small_container.dart';


class DiscountBar extends StatelessWidget {
  const DiscountBar({
    super.key,
    required this.discountPercentage,
  });

  final double discountPercentage;

  @override
  Widget build(BuildContext context) {
    double fontSize = 17;
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor.withOpacity(.7),
            AppColor.primaryColor.withOpacity(.8),
            AppColor.primaryColor.withOpacity(.7),
            AppColor.primaryColor.withOpacity(.8),
            AppColor.primaryColor.withOpacity(.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Text(
                'Delivery is ',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
              SmallContainer(
                object: discountPercentage.toInt().toString(),
                fontSize: fontSize,
              ),
              Text(
                ' cheaper',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ],
          ),
          Positioned(
              right: 0,
              bottom: 10,
              child: SvgPicture.asset(
                'assets/icons/discount-svgrepo-com.svg',
                height: 80,
              )),
        ],
      ),
    );
  }
}

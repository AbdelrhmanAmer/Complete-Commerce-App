import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/color.dart';


class DiscountBar extends StatelessWidget {
  const DiscountBar({
    super.key,
    required this.discountPercentage,
  });
  final double discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
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
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Container(
                height: 21,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.only(left: 5, right: 3, top: 3, bottom: 3),
                child: Text('${discountPercentage.toInt()}% ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11)),
              ),
              Text(
                ' cheaper',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
          Positioned(
              right: 0,
              bottom: 4,
              child: SvgPicture.asset(
                'assets/svgs/discount-svgrepo-com.svg',
                height: 58,
                width: 60,
              )),
        ],
      ),
    );
  }
}

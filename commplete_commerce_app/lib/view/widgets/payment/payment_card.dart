import 'package:commplete_commerce_app/core/class/cardType.dart';
import 'package:commplete_commerce_app/core/functions/mask_card_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/color.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.onPress,
    this.color = AppColor.primaryColor,
    this.iconSize,
  });

  final CardType cardType;
  final String cardNumber;
  final Color? color;
  final double? iconSize;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.onSurface;

    return Stack(
      children: [
        Container(
          height: 165,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF172fed),
                Color(0xFF463de6),
                Color(0xFF8527c2),
                Color(0xFFc527c3),
              ],
              stops: [0.1, 0.3, 0.6, .8],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/card.svg',
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      surfaceColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Icon(Icons.check_circle, color: surfaceColor, size: 22),
                ],
              ),
              Text(
                maskCardNumber(cardNumber),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: surfaceColor,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EaseShop\n10/24',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: surfaceColor),
                  ),
                  SvgPicture.asset(
                    'assets/icons/mastercard.svg',
                    height: iconSize ?? 40,
                    width: iconSize ?? 40,
                    fit: BoxFit.fitHeight,
                  ),

                ],
              )
            ],
          ),
        ),
        // Positioned(
        //   top: -5,
        //   left: -2,
        //   child: Text(
        //     cardType.name.toUpperCase(),
        //     style: GoogleFonts.libreFranklin(
        //         color: surfaceColor.withOpacity(.2),
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
        // const BackgroundDot(
        //   50,
        //   left: 30,
        //   bottom: 10,
        // ),
        // BackgroundDot(90, top: -5, right: size.width * .02),
        // BackgroundDot(120, bottom: -20, right: size.width * .2),
        // BackgroundDot(60, top: -20, right: size.width * .4),
      ],
    );
  }
}

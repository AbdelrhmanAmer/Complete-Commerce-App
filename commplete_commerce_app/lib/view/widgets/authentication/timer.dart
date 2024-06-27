import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Timer extends StatelessWidget {
  const Timer({
    super.key,
    required this.begin,
    required this.end,
    required this.duration,
  });
  final double begin;
  final double end;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'The Code will expired in ',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.5),
        ),
        TweenAnimationBuilder(
            tween: Tween(begin: begin, end: end),
            duration: Duration(seconds: duration),
            builder: (_, value, child) {
              return Text(
                '00:${value.toInt()}',
                style:
                    const TextStyle(fontSize: 14, color: AppColor.primaryColor),
              );
            })
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Timer extends StatelessWidget {
  const Timer({
    super.key,
    required this.begin,
    required this.end,
    required this.duration, // Duration in seconds
  });
  final double begin;
  final double end;
  final int duration;

  String _formatTime(double value) {
    int totalSeconds = value.toInt();
    int minutes = totalSeconds ~/ 60; // Calculate minutes
    int seconds = totalSeconds % 60; // Calculate remaining seconds

    // Format minutes and seconds as two digits
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'The code will expire in ',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.5),
        ),
        TweenAnimationBuilder(
            tween: Tween(begin: begin, end: end),
            duration: Duration(seconds: duration),
            builder: (_, value, child) {
              return Text(
                _formatTime(value),
                style:
                    const TextStyle(fontSize: 14, color: AppColor.primaryColor),
              );
            })
      ],
    );
  }
}

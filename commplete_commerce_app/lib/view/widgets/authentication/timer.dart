import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Timer extends StatelessWidget {
  const Timer({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    this.fontSize = 14,
    this.color = AppColor.primaryColor,
  });

  final int hours;
  final int minutes;
  final int seconds;
  final double fontSize;
  final Color color;

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600; // Calculate hours
    int minutes = (totalSeconds % 3600) ~/ 60; // Calculate minutes
    int seconds = totalSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    if (hoursStr == '00') {
      return '$minutesStr:$secondsStr';
    }
    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    int totalSeconds = hours * 3600 + minutes * 60 + seconds;

    return TweenAnimationBuilder(
      tween: Tween(begin: totalSeconds.toDouble(), end: 0.0),
      duration: Duration(seconds: totalSeconds),
      builder: (_, value, child) {
        return Text(
          _formatTime(value.toInt()),
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

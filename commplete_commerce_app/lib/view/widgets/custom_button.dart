import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.press,
    this.elevation = 0,
    this.textColor = Colors.black87,
  });
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final double elevation;
  final Color textColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: elevation,
          ),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: textColor))),
    );
  }
}

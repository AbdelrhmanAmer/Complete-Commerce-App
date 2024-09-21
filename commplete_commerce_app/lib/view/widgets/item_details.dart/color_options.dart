import 'package:flutter/material.dart';

import 'color_dot.dart';

class ColorOptions extends StatelessWidget {
  const ColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            ColorDot(
              color: Colors.black,
              onPress: () {},
              selected: true,
            ),
            ColorDot(
              color: Colors.lightBlue,
              onPress: () {},
            ),
            ColorDot(
              color: Colors.pink,
              onPress: () {},
            ),
          ],
        ),
      ],
    );
  }
}


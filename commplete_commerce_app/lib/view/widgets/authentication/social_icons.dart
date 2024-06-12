import 'package:flutter/material.dart';

import 'social_icon.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          icon: 'assets/icons/facebook-2.svg',
          press: () {},
        ),
        const SizedBox(width: 10),
        SocialIcon(
          icon: 'assets/icons/google-icon.svg',
          press: () {},
        ),
        const SizedBox(width: 10),
        SocialIcon(
          icon: 'assets/icons/twitter.svg',
          press: () {},
        ),
      ],
    );
  }
}

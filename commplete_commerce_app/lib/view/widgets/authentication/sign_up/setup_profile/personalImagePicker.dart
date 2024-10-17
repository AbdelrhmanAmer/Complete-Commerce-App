import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/constants.dart';

class PersonalImagePicker extends StatelessWidget {
  const PersonalImagePicker({
    super.key,
    this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: size.height * .08,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHigh,
              child: imagePath != null
                  ? Image.asset(imagePath!)
                  : Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        height: size.height * .08,
                        width: size.height * .05,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            ),
            Positioned(
              right: 5,
              bottom: 0,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/Camera-Bold.svg',
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.surface, BlendMode.srcIn),
                ),
                style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(5)),
              ),
            )
          ],
        ),
        SizedBox(height: size.height * .01),
        TextButton(
          onPressed: () {},
          child: Text(
            'Upload image',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        )
      ],
    );
  }
}

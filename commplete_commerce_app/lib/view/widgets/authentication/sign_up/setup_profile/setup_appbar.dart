import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

setupAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        'Setup Profile',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      centerTitle: true,
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset('assets/icons/info.svg'),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
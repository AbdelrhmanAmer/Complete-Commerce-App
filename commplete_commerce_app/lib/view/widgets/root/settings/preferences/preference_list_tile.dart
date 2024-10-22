import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';


class PreferenceListTile extends StatelessWidget {
  const PreferenceListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onSwitch,
    required this.value,
  });

  final String title;
  final String subTitle;
  final bool value;
  final  Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(subTitle),
                ],
              ),
            ),
            const SizedBox(width: 10),
            CupertinoSwitch(
              value: value,
              onChanged: (value) => onSwitch(value),
              activeColor: AppColor.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

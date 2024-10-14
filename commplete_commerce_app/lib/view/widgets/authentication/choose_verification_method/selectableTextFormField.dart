import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectableTile extends StatelessWidget {
  const SelectableTile({
    super.key,
    required this.initialValue,
    required this.suffixIcon,
    required this.selected,
    required this.onTap,
  });

  final String initialValue;
  final String suffixIcon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withOpacity(.4)),
      ),
      title: Text(initialValue, style: Theme.of(context).textTheme.bodyMedium),
      leading: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: SvgPicture.asset(
          suffixIcon,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ),

      trailing: selected
          ? Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            )
          : null,
    );
  }
}

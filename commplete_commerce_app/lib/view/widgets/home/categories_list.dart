import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.listLength,
    required this.categories,
  });
  final int listLength;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listLength,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/svgs/${categories[index]['image']}',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${categories[index]['name']}',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            );
          }),
    );
  }
}

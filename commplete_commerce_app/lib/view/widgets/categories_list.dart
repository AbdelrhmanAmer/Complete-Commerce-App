import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/category.dart';
import 'root/home/svg_image_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
    required this.onPress,
    this.selectedCategoryIndex = 0,
    this.hasImage = true,
  });

  final List<Category>? categories;
  final int? selectedCategoryIndex;
  final bool hasImage;
  final Function(int selectedIndex) onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hasImage ? 105 : 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories!.length,
        itemBuilder: (ctx, index) {
          return Container(
            width: 70,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (!hasImage && selectedCategoryIndex == index)
                      ? AppColor.primaryColor
                      : Colors.transparent,
                  width: 2.5,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                onPress(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hasImage)
                    SvgImageCard(
                      imagePath:
                          'assets/icons/${categories![index].categoryImage}',
                    ),
                  const SizedBox(height: 7),
                  Text(
                    '${categories![index].categoryName}',
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

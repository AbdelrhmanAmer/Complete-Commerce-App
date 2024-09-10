import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/constants.dart';
import '../../controller/items_controller.dart';
import '../widgets/items/items_appbar.dart';
import '../widgets/categories_list.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());

    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ItemsAppbar(),
            const SizedBox(height: 10),
            Obx(
              () => CategoriesList(
                categories: controller.categories,
                selectedCategoryIndex: controller.selectedCategoryIndex.value,
                onPress: (index) {
                  controller.changeSelectedCategory(index);
                },
                hasImage: false,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.selectedCategoryItems.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        '${controller.selectedCategoryItems[index].itemName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${controller.selectedCategoryItems[index].itemDescription}',
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Image.asset(
                        'assets/images/${controller.selectedCategoryItems[index].itemImage}',
                        fit: BoxFit.fitWidth,
                        width: size.width * .15,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

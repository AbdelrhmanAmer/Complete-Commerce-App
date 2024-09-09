import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ItemsAppbar(),
              const SizedBox(height: 10),
              Obx(() => CategoriesList(
                    categories: controller.categories!,
                    selectedCategoryIndex:
                        controller.selectedCategoryIndex.value,
                    onPress: (index) {
                      controller.changeSelectedCategory(index);
                    },
                    hasImage: false,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}

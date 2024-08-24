import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/authentication/timer.dart';
import '../../core/class/status_request.dart';
import '../../controller/home_controller.dart';
import '../widgets/home/categories_list.dart';
import '../widgets/home/custom_appbar.dart';
import '../widgets/home/discount_bar.dart';
import '../widgets/home/item_card.dart';
import '../widgets/home/search_field.dart';
import '../widgets/home/section_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SafeArea(
      child: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.statusRequest.value == StatusRequest.loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              CustomAppBar(controller: controller),
                              const SizedBox(height: 20),
                              const SearchField(),
                              const SizedBox(height: 15),
                              const DiscountBar(discountPercentage: 50),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              SectionBar(title: 'Categories', onPress: () {}),
                              const SizedBox(height: 10),
                              CategoriesList(
                                  categories: controller.categories,
                                  onPress: () {}),
                              SectionBar(
                                title: 'Flash Sale',
                                onPress: () {},
                                enableTimer: true,
                                timer: const Timer(
                                  hours: 2,
                                  minutes: 0,
                                  seconds: 0,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 245,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.discountedItems.length,
                                  itemBuilder: (_, index) => ItemCard(
                                    item: controller.discountedItems[index],
                                    onPress: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

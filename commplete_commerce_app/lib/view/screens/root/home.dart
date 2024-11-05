import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/root/home_controller.dart';
import '../../../core/constant/app_routes.dart';
import '../../../core/class/status_request.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/authentication/timer.dart';
import '../../widgets/categories_list.dart';
import '../../widgets/root/home/item_card.dart';
import '../../widgets/root/home/section_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return FutureBuilder(
      future: homeController.initializeControllers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: Scaffold(
              backgroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              body: GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.statusRequest.value == StatusRequest.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return CustomScrollView(
                      slivers: [
                        // Sliver Padding for spacing
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHigh,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    SectionBar(
                                        title: 'Categories', onPress: () {}),
                                    const SizedBox(height: 10),
                                    CategoriesList(
                                      categories: controller.categories,
                                      onPress: (index) {
                                        controller
                                            .goToCategoryItemsScreen(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: size.height * .01)),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          sliver: SliverToBoxAdapter(
                            child: SectionBar(
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
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: size.height * .01)),

                        SliverPadding(
                          padding: const EdgeInsets.only(left: 15),
                          sliver: SliverToBoxAdapter(
                            child: SizedBox(
                              height: 220,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.discountedItems.length,
                                itemBuilder: (_, index) => ItemCard(
                                  item: controller.discountedItems[index],
                                  onPress: () => Get.toNamed(
                                    Routes.itemDetails,
                                    arguments: {
                                      'item': controller.discountedItems[index],
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: size.height * .02)),

                        // Products Section
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          sliver: SliverToBoxAdapter(
                            child: SectionBar(
                              title: 'Products',
                              onPress: () {},
                              enableTimer: false,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: size.height * .01)),

                        // Products - Horizontal List
                        SliverPadding(
                          padding: const EdgeInsets.only(left: 15),
                          sliver: SliverToBoxAdapter(
                            child: SizedBox(
                              height: 220,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.items.length,
                                itemBuilder: (_, index) => ItemCard(
                                  item: controller.items[index],
                                  onPress: () => Get.toNamed(
                                    Routes.itemDetails,
                                    arguments: {
                                      'item': controller.items[index],
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/root_controller.dart';
import '../../../core/constant/color.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    super.key,
    required this.controller,
  });

  final RootController controller;

  @override
  Widget build(BuildContext context) {
    const double iconHeight = 25;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: _getColorFilter(controller.currentPageIndex == 0, context),
            height: iconHeight,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Category.svg',
            colorFilter: _getColorFilter(controller.currentPageIndex == 1, context),
            height: iconHeight,
          ),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Bag.svg',
            colorFilter: _getColorFilter(controller.currentPageIndex == 2, context),
            height: iconHeight,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favorite.svg',
            colorFilter: _getColorFilter(controller.currentPageIndex == 3, context),
            height: iconHeight,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Profile.svg',
            colorFilter: _getColorFilter(controller.currentPageIndex == 4, context),
            height: 28,
          ),
          label: 'Profile',
        ),
      ],
      selectedLabelStyle:
          const TextStyle(color: AppColor.primaryColor, fontSize: 14),
      selectedFontSize: 13,
      selectedItemColor: AppColor.primaryColor,
      unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(.8)),
      showSelectedLabels: true,
      currentIndex: controller.currentPageIndex,
      unselectedItemColor: Colors.transparent,
      backgroundColor: Theme.of(context).colorScheme.surface, // Set your desired background color here
      onTap: (int pageIndex) {
        controller.changePage(pageIndex);
      },

    );
  }

  ColorFilter _getColorFilter(bool isSelected, BuildContext context) {
    return ColorFilter.mode(
      isSelected ? AppColor.primaryColor : Theme.of(context).colorScheme.onSurface.withOpacity(.8),
      BlendMode.srcIn,
    );
  }
}

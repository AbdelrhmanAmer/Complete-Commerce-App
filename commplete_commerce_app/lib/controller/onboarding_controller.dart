import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

abstract class OnBoardingController extends GetxController {
  onClick();
  onPageChanged(int value);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  late PageController pageController;

  @override
  onClick() {
    currentPage++;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int value) {
    currentPage = value;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

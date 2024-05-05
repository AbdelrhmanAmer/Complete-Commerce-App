import 'package:commplete_commerce_app/core/constant/app_routes.dart';
import 'package:commplete_commerce_app/data/data_source/static/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int value);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  late PageController pageController;

  @override
  next() {
    currentPage++;

    if(currentPage >= onBoardingList.length){
      skip();
    }else{
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
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
  
  @override
  skip() {
    Get.offAllNamed(Routes.login);
  }
}

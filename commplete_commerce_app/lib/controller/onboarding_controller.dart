import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/data_source/static/static.dart';
import '../core/constant/app_routes.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int value);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  MyServices myServices = Get.find();

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
    myServices.sharedPreferences.setString('step', '1');
    Get.offAllNamed(Routes.signIn);
  }
}

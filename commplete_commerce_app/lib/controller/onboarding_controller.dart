import 'package:get/state_manager.dart';

abstract class OnBoardingController extends GetxController{
  onClick();
  onPageChanged(int value);
}

class OnBoardingControllerImp extends OnBoardingController{
  int currentPage = 0;

  @override
  onClick() {

  }

  @override
  onPageChanged(int value) {
    currentPage = value;
    update();
  }

}
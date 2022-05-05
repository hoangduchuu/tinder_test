import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProfileCardController extends GetxController {
  RxInt currentSliderPage = 0.obs;
  late CarouselController carouselController;

  @override
  void onInit() {
    carouselController = CarouselController();
    super.onInit();
  }

  void onNext() {
    if (carouselController != null) {
      carouselController.nextPage();
      currentSliderPage += 1;
    }
  }

  void onPrevious() {
    if (carouselController != null) {
      carouselController.nextPage();
      currentSliderPage += 1;
    }
  }

  void resetIndicatorIndex() {
    currentSliderPage.value = 0;
    carouselController.jumpToPage(0);
  }

  void onPageChanged(int index) {
    currentSliderPage.value = index;
  }
}

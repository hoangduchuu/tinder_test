import 'package:get/get.dart';
import 'package:m_tinder/ui/screen/user_detail/user_controller.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
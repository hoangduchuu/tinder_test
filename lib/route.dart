import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';
import 'package:m_tinder/main.dart';
import 'package:m_tinder/main_binding.dart';
import 'package:m_tinder/ui/screen/home/home_binding.dart';
import 'package:m_tinder/ui/screen/home/home_screen.dart';
import 'package:m_tinder/ui/screen/user_detail/user_bindings.dart';
import 'package:m_tinder/ui/screen/user_detail/user_detail_screen.dart';

final routes = [
  GetPage(name: Routes.home, page: () => HomeScreen(), bindings: [HomeBinding(), MainBinding()]),
  GetPage(
      name: Routes.userDetail,
      page: () {
        var agrs = Get.arguments;
        return UserDetailScreen(user: agrs['user']);
      },
      bindings: [MainBinding(), UserBindings()]),
  GetPage(
    name: Routes.init,
    page: () => const MyHomePage(title: 'title'),
  ),
];

class Routes {
  static const String home = '/home';
  static const String init = '/init';
  static const String userDetail = '/userDetail';
}

class AppNavigator {
  static void openHome() {
    Get.to(Routes.home);
  }

  static void openUserDetail(UserModel userModel) {
    Get.toNamed(Routes.userDetail, arguments: {'user': userModel});
  }
}

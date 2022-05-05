import 'package:get/get.dart';
import 'package:m_tinder/main.dart';
import 'package:m_tinder/main_binding.dart';
import 'package:m_tinder/ui/screen/home/home_binding.dart';
import 'package:m_tinder/ui/screen/home/home_screen.dart';

final routes = [
  GetPage(name: Routes.home, page: () => HomeScreen(), bindings: [HomeBinding(), MainBinding()]),
  GetPage(
    name: Routes.init,
    page: () => const MyHomePage(title: 'title'),
  ),
];

class Routes {
  static const String home = '/home';
  static const String init = '/init';
}

class AppNavigator {
  static void openHome() {
    Get.to(Routes.home);
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/screen/home/tabs/explore_screen.dart';
import 'package:m_tinder/ui/screen/home/tabs/ignored_screen.dart';
import 'package:m_tinder/ui/screen/home/tabs/likes_screen.dart';
import 'package:m_tinder/ui/screen/home/utils.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

import 'home_controller.dart';

@immutable
class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.push(Get.context!, MaterialPageRoute(builder: (_) => const DatabaseList()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(image: AssetImage('assets/images/profile.png'), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/explore_active_icon.svg'),
                    Text(
                      ' Tinder',
                      style: TextStyle(
                          fontSize: 24, color: const Color(0xfffe3c72).withOpacity(0.8), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                kDebugMode
                    ? Obx(
                        () => SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(child: Text('${controller.users.length}')),
                        ),
                      )
                    : const SizedBox(
                        height: 50,
                        width: 50,
                      )
              ],
            ),
          ),
        ),
        Expanded(child: Obx(() => getBodyWidget())),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        iconSize: 14,
        elevation: 0.0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          getBottomBarItem(index: 0),
          getBottomBarItem(index: 1, height: 35.0),
          getBottomBarItem(index: 2),
          getBottomBarItem(index: 3),
        ],
        currentIndex: controller.selectedMenu.value,
        onTap: controller.onMenuTap,
      ),
    );
  }

  BottomNavigationBarItem getBottomBarItem({required int index, double height = 25.0}) {
    var iconItem = navigationItems[index];
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          iconItem['icon'].toString(),
          height: height,
        ),
        label: '',
        activeIcon: SvgPicture.asset(iconItem['activeIcon'].toString(), height: height));
  }

  Widget getBodyWidget() {
    switch (controller.selectedMenu.value) {
      case 0:
        return ExploreScreen();
      case 1:
        return const LikesScreen();
      case 2:
        return const IgnoredScreen();
      default:
        return const Center(
          child: Text('Profile'),
        );
    }
  }
}

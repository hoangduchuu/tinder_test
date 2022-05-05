import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/home/home_controller.dart';
import 'package:m_tinder/ui/home/tabs/explore_screen.dart';
import 'package:m_tinder/ui/home/utils.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

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
                if (kDebugMode) Obx(() => Text('${controller.users.length}'))
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
        return Container(
          child: const Center(
            child: Text('Ignored'),
          ),
        );
      case 2:
        return Container(
          child: const Center(
            child: Text('Liked'),
          ),
        );
      default:
        return Container(
          child: const Center(
            child: Text('Profile'),
          ),
        );
    }
  }
}

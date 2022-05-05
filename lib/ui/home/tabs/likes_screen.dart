import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/home/home_controller.dart';

import '../../widgets/card.dart';

class LikesScreen extends GetView<HomeController> {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.likedUsers.length,
          itemBuilder: (BuildContext ctx, index) {
            var _user = controller.likedUsers[index];
            return CardWidget(
              user: _user,
            );
          },
        ),
      ),
    );
  }
}

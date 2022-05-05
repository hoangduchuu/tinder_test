import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/forked/flutter_tindercard.dart';

import '../../../widgets/action_button.dart';
import '../../../widgets/profile_card_widget.dart';
import '../home_controller.dart';
import '../utils.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.bottom,
            totalNum: _homeController.users.length,
            maxWidth: context.width,
            maxHeight: context.height * 0.8,
            minWidth: context.width * 0.8,
            minHeight: context.height * 0.6,
            cardBuilder: (context, index) {
              var _user = _homeController.users[index];
              return ProfileCardWidget(user: _user);
            },
            // cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                // _homeController.like(item)
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
              if (orientation == CardSwipeOrientation.right) {
                _homeController.handleLikeAction();
              }
              if (orientation == CardSwipeOrientation.left) {
                _homeController.handleIgnoreAction();
              }
            },
          ),
          Positioned(
            bottom: 12.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              margin: const EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: actionButtonData
                    .map((Map<String, dynamic> item) => ActionButton(
                          image: item['icon'],
                          color: Color(item['color']),
                          height: item['height'],
                          iconSize: item['iconSize'],
                          onTap: () {
                            //
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

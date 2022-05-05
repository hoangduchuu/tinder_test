import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/forked/flutter_tindercard.dart';
import 'package:m_tinder/ui/widgets/profile_card/profile_card_controller.dart';

import '../../../widgets/action_button.dart';
import '../../../widgets/profile_card/profile_card_widget.dart';
import '../home_controller.dart';
import '../utils.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find<HomeController>();

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
            animDuration: 500,
            minWidth: context.width * 0.8,
            minHeight: context.height * 0.6,
            cardController: _homeController.cardController,
            cardBuilder: (context, index) {
              var _user = _homeController.users[index];
              return ProfileCardWidget(
                isFirstLayer: index == 0,
                user: _user,
                onInfoIconTap: (mUser) {
                  _homeController.goToDetailScreen(mUser);
                },
              );
            },
            // cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment_homeController.onAlignChange(align);
              _homeController.onAlignChange(align.x,align.y);
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

              // FIXME: implement write action to own & up
              if (orientation == CardSwipeOrientation.down) {
                _homeController.handleLikeAction();
              }
              if (orientation == CardSwipeOrientation.up) {
                _homeController.handleLikeAction();
              }
              Get.find<ProfileCardController>().resetIndicatorIndex();
              _homeController.resetHorizonCardAlign();
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
                            _homeController.handleOnTap(item);
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

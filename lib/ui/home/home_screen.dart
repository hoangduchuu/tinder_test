import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';
import 'package:m_tinder/ui/home/home_controller.dart';
import 'package:m_tinder/ui/widgets/profile_card_widget.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

import '../forked/flutter_tindercard.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Remote count: ${controller.users.value.length}'),
          actions: [
            InkWell(
              child: Icon(Icons.table_rows_outlined),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DatabaseList()));
              },
            )
          ],
        ),
        body: Stack(
          children: [
            TinderSwapCard(
              swipeUp: true,
              swipeDown: true,
              orientation: AmassOrientation.bottom,
              totalNum: controller.users.length,
              maxWidth: context.width,
              maxHeight: context.height * 0.8,
              minWidth: context.width * 0.8,
              minHeight: context.height * 0.6,
              cardBuilder: (context, index) {
                var _user = controller.users[index];
                return ProfileCardWidget(user: _user);
              },
              // cardController: controller = CardController(),
              swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
              },
            ),
          ],
        ),
      ),
    );
  }
}

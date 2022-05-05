import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/home/home_controller.dart';
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
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 2),
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: context.width,
                          height: context.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('${_user.picture}'), fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: context.width,
                          height: context.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black.withOpacity(1),
                              Colors.black.withOpacity(0),
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0),
                            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Container(
                                      width: context.width * 0.72,
                                      margin: const EdgeInsets.only(bottom: 70.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                _user.lastName ?? '',
                                                style: const TextStyle(
                                                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '19Tuoi',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration:
                                                    const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Recently Active",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: List.generate(2, (indexLikes) {
                                              return Padding(
                                                padding: const EdgeInsets.only(right: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(30),
                                                      color: Colors.white.withOpacity(0.5)),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                                                    child: Text(
                                                      'real mandrid',
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context.width * 0.2,
                                        child: InkWell(
                                          onTap: () {
                                            // controller.openUserDetailScreen(controller.users[index]);
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.info,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
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

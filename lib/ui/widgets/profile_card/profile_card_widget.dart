import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';
import 'package:m_tinder/ui/screen/home/utils.dart';
import 'package:m_tinder/ui/widgets/like_widget.dart';
import 'package:m_tinder/ui/widgets/nope_widget.dart';
import 'package:m_tinder/ui/widgets/profile_card/profile_card_controller.dart';
import 'package:m_tinder/ui/widgets/very_like.dart';

import '../../screen/home/home_controller.dart';

@immutable
class ProfileCardWidget extends StatelessWidget {
  ProfileCardWidget({Key? key, required UserModel user, required this.isFirstLayer, this.onInfoIconTap})
      : _user = user,
        super(key: key);

  final UserModel _user;

  final bool isFirstLayer;

  final Function? onInfoIconTap;

  final HomeController controller = Get.find<HomeController>();
  final ProfileCardController c = Get.find<ProfileCardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCardController>(builder: (ctl) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 2),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Obx(
            () => InkWell(
              onTap: () {
                c.onNext();
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            height: context.height,
                            padEnds: false,
                            viewportFraction: 1,
                            pageSnapping: true,
                            onPageChanged: (index, reason) {
                              c.onPageChanged(index);
                            },
                          ),
                          carouselController: c.carouselController,
                          items: getMockAvatar('${_user.picture}').map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Hero(
                                  tag: '${_user.id}',
                                  child: Container(
                                    width: context.width,
                                    height: context.height,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: getItemSliderPhoto(i), fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getMockAvatar('${_user.picture}').asMap().entries.map((entry) {
                      return Flexible(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 2, top: 6, right: 2),
                            height: 8.0,
                            decoration: BoxDecoration(
                                // ignore: unrelated_type_equality_checks
                                color:
                                    ((isFirstLayer && c.currentSliderPage == entry.key) ? Colors.white : Colors.grey)),
                          ),
                        ),
                      );
                    }).toList(),
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
                                          _user.getAge(),
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
                                          decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
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
                                      if (onInfoIconTap != null) {
                                        onInfoIconTap!(_user);
                                      }
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
                  Visibility(
                    visible: isFirstLayer && controller.cardHorizonAlignX > 1,
                    child: Positioned(
                      top: 24,
                      left: 24,
                      child: LikeWidget(align: controller.cardHorizonAlignX.value),
                    ),
                  ),
                  Visibility(
                    visible: isFirstLayer && controller.cardHorizonAlignX < -1,
                    child: Positioned(
                      right: 24,
                      top: 30,
                      child: NopeWidget(align: controller.cardHorizonAlignX.value),
                    ),
                  ),
                  Visibility(
                    visible: isFirstLayer && controller.cardVerticalAlignY < -3,
                    child: const Positioned(
                      bottom: 24,
                      left: 10,
                      right: 10,
                      child: VeryLike(align: 111),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  ImageProvider getItemSliderPhoto(String i) {
    if (i.startsWith('https')) {
      return NetworkImage(i);
    }
    return AssetImage(i);
  }
}

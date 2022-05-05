import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';
import 'package:m_tinder/ui/screen/user_detail/user_controller.dart';

import '../../widgets/action_button.dart';

class UserDetailScreen extends GetView<UserController> {
  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${user.id}',
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildImageWidget(context),
                    buildUserInfo(context),
                    const SizedBox(width: 100,height: 100,)
                  ],
                ),
              ),
            ),
            getActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildImageWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: context.height * 0.7,
              width: context.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('${user.picture}'), fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 25.0,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 30,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    // changes position of shadow
                  ),
                ],
              ),
              child: const Center(child: Icon(Icons.arrow_downward, color: Colors.white, size: 30)),
            ),
          ),
        ),
      ],
    );
  }

  Widget getActionButtons() {
    return Positioned(
      bottom: 12.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionButton(
              image: 'assets/images/close_icon.svg',
              color: Colors.white,
              height: 60.0,
              iconSize: 30.0,
              background: Colors.white,
              onTap: ()=>controller.dislike(user),
            ),
            const SizedBox(width: 20.0),
            ActionButton(
              image: 'assets/images/star_icon.svg',
              color: Colors.white,
              height: 60.0,
              iconSize: 30.0,
              background: Colors.white,
              onTap: controller.superLike,
            ),
            const SizedBox(width: 20.0),
            ActionButton(
              image: 'assets/images/like_icon.svg',
              color: Colors.white,
              height: 60.0,
              iconSize: 30.0,
              background: Colors.white,
              onTap: ()=> controller.like(user),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [
              Text(
                '${user.firstName}',
                style: const TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '25 tuoi',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
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
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: List.generate(
              2,
              (indexLikes) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      child: Text(
                        "Mandirista",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

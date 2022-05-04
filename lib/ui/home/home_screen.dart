import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/ui/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.users.value == null
            ? Container()
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  var item = controller.users[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${item.title} \t ${item.lastName}"),
                      ElevatedButton(
                        onPressed: () {
                          controller.ignore(item);
                        },
                        child: Text('Like'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.like(item);
                        },
                        child: Text('DisLike'),
                      )
                    ],
                  );
                },
                itemCount: controller.users.value.length,
              ),
      ),
    );
  }
}

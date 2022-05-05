import 'package:flutter/material.dart';
import 'package:m_tinder/domain/model/model.dart';
import 'package:m_tinder/route.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${user.id}',
      child: Scaffold(
        body: InkWell(
          onTap: () {
            AppNavigator.openUserDetail(user);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('${user.picture}'), fit: BoxFit.cover),
                  ),
                ),
                Container(
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
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${user.firstName} ${user.lastName}',
                                      style:
                                          const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

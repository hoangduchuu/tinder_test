import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    Key? key,
    required UserModel user,
  })  : _user = user,
        super(key: key);

  final UserModel _user;

  @override
  Widget build(BuildContext context) {
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
                                    style:
                                        const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '19yrs',
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
  }
}

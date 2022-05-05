import 'package:get/get.dart';
import 'package:m_tinder/domain/repo/user_repo.dart';

import '../../domain/model/model.dart';

class HomeController extends GetxController {
  final UserRepo _repo;

  HomeController(this._repo);

  final users = <UserModel>[].obs;

  @override
  void onInit() {
    test();
  }

  void test() {
    // _repo.getUsers().then((value) {
    //   print("us: ${value.toString()}");
    //   users.value = value;
    // });
    //

    _repo.getUserPayload(1).then((value){
      if(value.users?.isNotEmpty == true){
        print('user: ${value.users.toString()}');
        users.value = value.users!;
      }else{
        print('empty: ${value.users.toString()}');

      }
    });

    _repo.getLikedUsers().listen((event) {
      print("LIKE: ${event.length}");
      print("LIKE: ${event}");
    });

    _repo.getIgnoreUsers().listen((event) {
      print("DIS_LIKE: ${event.length}");
      print("DIS_LIKE: ${event}");
    });
  }

  void like(UserModel item) {
    _repo.like(item);
  }

  void ignore(UserModel item) {
    _repo.ignore(item);
  }
}

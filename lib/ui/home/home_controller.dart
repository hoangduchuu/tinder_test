import 'package:get/get.dart';
import 'package:m_tinder/domain/repo/user_repo.dart';

import '../../domain/model/model.dart';
import '../widgets/action_button.dart';

class HomeController extends GetxController {
  final UserRepo _repo;

  HomeController(this._repo);

  var selectedMenu = 0.obs;

  final users = <UserModel>[].obs;

  final likedUsers = <UserModel>[].obs;

  final ignoredUsers = <UserModel>[].obs;

  @override
  void onInit() {
    initData();
  }

  void initData() {
    _repo.getUserPayload(1).then((value) {
      if (value.users?.isNotEmpty == true) {
        users.value = value.users!;
      }
    });

    _repo.getLikedUsers().listen((value) {
      print('values -- ${value.length}');
      if (value.isNotEmpty == true) {
        likedUsers.value = value;
      }
    });

    _repo.getIgnoreUsers().listen((value) {
      if (value.isNotEmpty == true) {
        ignoredUsers.value = value;
      }
    });
  }

  void onMenuTap(int index) {
    selectedMenu.value = index;
  }

  void _like(UserModel item) {
    _repo.like(item);
  }

  void _ignore(UserModel item) {
    _repo.ignore(item);
  }

  /// write to local db then mo to next user
  void handleLikeAction() {
    _like(users.first);
    users.removeAt(0);
  }

  /// write to local db then mo to next user
  void handleIgnoreAction() {
    _ignore(users.first);
    users.removeAt(0);
  }
}

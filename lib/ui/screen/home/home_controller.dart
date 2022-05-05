import 'dart:collection';

import 'package:get/get.dart';
import 'package:m_tinder/domain/model/user_payload.dart';
import 'package:m_tinder/domain/repo/user_repo.dart';
import 'package:m_tinder/route.dart';
import '../../../domain/model/model.dart';
import '../../forked/flutter_tindercard.dart';
import '../../widgets/action_button.dart';

class HomeController extends GetxController {
  final UserRepo _repo;

  HomeController(this._repo);

  var selectedMenu = 0.obs;

  final users = <UserModel>[].obs;

  final likedUsers = <UserModel>[].obs;

  final ignoredUsers = <UserModel>[].obs;

  var currentPage = 1;

  late UserPayload _userPayload;

  late CardController cardController;

  @override
  void onInit() {
    initControllers();
    initData();
  }

  void initControllers() {
    cardController = CardController();
  }

  //region working with data
  void initData() {
    _repo.getUserPayload(currentPage).then((value) {
      _userPayload = value;
      if (value.users?.isNotEmpty == true) {
        users.value = value.users!;
      }
    });

    /// listen liked user list
    _repo.getLikedUsers().listen((value) {
      if (value.isNotEmpty == true) {
        likedUsers.value = value;
      }
    });

    /// listen ignored user list
    _repo.getIgnoreUsers().listen((value) {
      if (value.isNotEmpty == true) {
        ignoredUsers.value = value;
      }
    });
  }

  void onMenuTap(int index) {
    selectedMenu.value = index;
  }

  Future<dynamic> _like(UserModel item) {
    return _repo.like(item);
  }

  Future<dynamic> _ignore(UserModel item) {
    return _repo.ignore(item);
  }

  /// write to local db then mo to next user
  Future<void> handleLikeAction() async {
    await _like(users.first);
    users.removeAt(0);
    _loadMoreDataIfPossible();
  }

  /// write to local db then mo to next user
  Future<void> handleIgnoreAction() async {
    await _ignore(users.first);
    users.removeAt(0);
    _loadMoreDataIfPossible();
  }

  void _loadMoreDataIfPossible() {
    if (users.length < 5) {
      if (_userPayload.page! * _userPayload.limit! <= _userPayload.total!) {
        currentPage += 1;
        _repo.getUserPayload(currentPage).then((value) {
          _userPayload = value;
          if (value.users?.isNotEmpty == true) {
            List<UserModel> temp = users.value;
            temp.addAll(value.users!);
            users.value = temp;
          } else {
            // show out of data here
          }
        });
      }
    }
  }

  //endregion

  //region handle bottom card button actions
  Future<void> handleOnTap(Map<String, dynamic> item) async {
    switch (item['type'] as ActionButtonType) {
      case ActionButtonType.back:
        break;
      case ActionButtonType.dislike:
        cardController.triggerLeft();
        break;
      case ActionButtonType.superLike:
        break;
      case ActionButtonType.like:
        cardController.triggerRight();
        break;
      case ActionButtonType.speedUp:
        break;
    }
  }

  void goToDetailScreen(UserModel mUser) {
    AppNavigator.openUserDetail(mUser)?.then((value) {
      // handle on action button pressed
      if (value == null || value['status'] == null) return;

      String status = value['status'];

      if (status.toString() == 'like') {
       Future.delayed(const Duration(milliseconds: 200),(){
         cardController.triggerRight();
       });
      }
      if (status.toString() == 'ignore') {
        Future.delayed(const Duration(milliseconds: 200),(){
          cardController.triggerLeft();
        });
      }
    });
  }
//endregion

}

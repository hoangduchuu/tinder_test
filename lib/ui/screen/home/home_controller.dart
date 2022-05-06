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

  final RxDouble cardHorizonAlignX = 0.0.obs;
  final RxDouble cardVerticalAlignY = 0.0.obs;

  @override
  void onInit() {
    initControllers();
    initData();
    super.onInit();
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
        updateAgeToModel(users);
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
            // ignore: invalid_use_of_protected_member
            List<UserModel> temp = users.value;
            temp.addAll(value.users!);
            users.value = temp;

            updateAgeToModel(value.users);
          } else {
            // show out of data here
          }
        });
      }
    }
  }

  /// Call the API to get detail, then update date of birth field in to the model
  void updateAgeToModel(List<UserModel>? models) {
    if (models == null || models.isEmpty) return;
    models.forEach((element) {
      _repo.getUserDetail('${element.id}').then((value) {
        users[users.indexWhere((element) => element.id == value.id)].dateOfBirth = value.dateOfBirth;
      });
    });
  }

  //endregion

  //region handle bottom card button actions
  Future<void> handleOnTap(Map<String, dynamic> item) async {
    switch (item['type'] as ActionButtonType) {
      case ActionButtonType.back:
        break;
      case ActionButtonType.dislike:
        _handleDislikePress();
        break;
      case ActionButtonType.superLike:
        _handleSupperLikePress();
        break;
      case ActionButtonType.like:
        _handleLikePress();
        break;
      case ActionButtonType.speedUp:
        break;
    }
  }

  // enable like-tag then trigger after that
  void _handleLikePress() {
    cardHorizonAlignX.value = 15;
    Future.delayed(const Duration(milliseconds: 500), () {
      cardController.triggerRight();
      resetHorizonCardAlign();
    });
  }

  void _handleSupperLikePress() {
    cardVerticalAlignY.value = -100;
    Future.delayed(const Duration(milliseconds: 500), () {
      cardController.triggerUp();
      resetHorizonCardAlign();
    });
  }

  void _handleDislikePress() {
    // enable like-tag then trigger after that
    cardHorizonAlignX.value = -15;
    Future.delayed(const Duration(milliseconds: 500), () {
      cardController.triggerLeft();
      resetHorizonCardAlign();
    });
  }

  // endregion

  void goToDetailScreen(UserModel mUser) {
    AppNavigator.openUserDetail(mUser)?.then((value) {
      // handle on action button pressed
      if (value == null || value['status'] == null) return;

      String status = value['status'];

      if (status.toString() == 'like') {
        _handleLikePress();
      }
      if (status.toString() == 'ignore') {
        _handleDislikePress();
      }
    });
  }

  //region handle card swiping
  void onAlignChange(double x, double y) {
    cardHorizonAlignX.value = x;
    cardVerticalAlignY.value = y;
  }

  void resetHorizonCardAlign() {
    cardHorizonAlignX.value = 0;
    cardVerticalAlignY.value = 0;
  }

//endregion
}

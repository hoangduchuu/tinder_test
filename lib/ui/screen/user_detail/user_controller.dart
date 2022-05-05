import 'package:get/get.dart';
import 'package:m_tinder/domain/model/model.dart';

import '../../../domain/repo/user_repo.dart';

class UserController extends GetxController {
  final UserRepo _repo;

  UserController(this._repo);

  void dislike(UserModel user) {
    _repo.ignore(user).then((value) {
      Get.back(result: {'status': 'ignore'});
    });
  }

  void like(UserModel user) {
    _repo.ignore(user).then((value) {
      Get.back(result: {'status': 'like'});
    });
  }

  void superLike() {
    // TODO: Save to database or do the same things
  }
}

import 'package:get/get.dart';
import 'package:m_tinder/ui/screen/user_detail/user_controller.dart';

import '../../../data/repository/local/repo/user_local_data_source.dart';
import '../../../data/repository/remote/user_remote_data_source.dart';
import '../../../data/repository/repo/user_repo_impl.dart';
import '../../../domain/repo/user_repo.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepo>(() => UserRepositoryImpl());
    Get.lazyPut<UserRemoteRepo>(() => UserRemoteRepo());
    Get.lazyPut<UserCacheRepo>(() => UserCacheRepo());

    Get.lazyPut<UserController>(() => UserController(Get.find()));
  }
}

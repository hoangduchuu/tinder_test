import 'package:get/get.dart';
import 'package:m_tinder/data/repository/repo/user_repo_impl.dart';
import 'package:m_tinder/domain/repo/user_repo.dart';

import '../../../data/repository/local/repo/user_local_data_source.dart';
import '../../../data/repository/remote/user_remote_data_source.dart';
import '../../widgets/profile_card/profile_card_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<UserRepo>(() => UserRepositoryImpl());
    Get.lazyPut<UserRemoteRepo>(() => UserRemoteRepo());
    Get.lazyPut<UserCacheRepo>(() => UserCacheRepo());

    Get.lazyPut<HomeController>(() => HomeController(Get.find()));

    // Get.put<ProfileCardController>(ProfileCardController(),permanent: true);
    Get.lazyPut<ProfileCardController>(() => ProfileCardController());
  }
}

import 'package:get/get.dart';

import 'data/repository/local/db/app_database.dart';
import 'data/repository/local/repo/user_local_data_source.dart';



class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final instance =  AppDatabase();
    Get.put(instance);

    Get.put<UserCacheRepo>(UserCacheRepo(), permanent: true);

  }
}

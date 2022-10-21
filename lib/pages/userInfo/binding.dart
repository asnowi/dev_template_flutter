import 'package:get/get.dart';

import 'userInfo.dart';


class UserInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserInfoController>(() => UserInfoController());

  }

}
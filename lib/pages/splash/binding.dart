import 'package:get/get.dart';

import 'splash.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    // Get.lazyPut<IndexController>(() => IndexController());
    Get.put<SplashController>(SplashController());
  }
}
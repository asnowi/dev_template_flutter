import 'package:dev_template_flutter/common/base/base.dart';

import 'main.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }

}
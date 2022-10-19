import 'package:dev_template_flutter/common/base/base.dart';

import 'mine.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }

}
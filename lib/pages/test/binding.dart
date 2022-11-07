import 'package:dev_template_flutter/common/base/base.dart';

import 'test.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestController>(() => TestController());
  }

}
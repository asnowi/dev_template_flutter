import 'package:dev_template_flutter/common/base/base.dart';

import 'web.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebController>(() => WebController());
  }
}
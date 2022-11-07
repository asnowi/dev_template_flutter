import 'package:dev_template_flutter/common/base/base.dart';

import 'preview.dart';

class PreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewController>(() => PreviewController());
  }

}
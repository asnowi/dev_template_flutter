import 'package:dev_template_flutter/common/base/base.dart';

import 'scanner.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(() => ScannerController());
  }

}
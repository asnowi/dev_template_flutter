import 'package:dev_template_flutter/common/base/base.dart';

import 'setting.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }

}
import 'package:dev_template_flutter/common/base/base.dart';

import 'location.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }

}
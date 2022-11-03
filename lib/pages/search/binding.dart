import 'package:dev_template_flutter/common/base/base.dart';

import 'search.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }

}
import 'package:dev_template_flutter/common/base/base.dart';

import 'widget/widget.dart';

class PreviewController extends BaseGetController {

  List<Photo> list = [];

  @override
  void onReady() {
    final map = Get.arguments;
    if(map != null) {
      list = map['photos'];
      if(list.isNotEmpty) {
        update(['preview']);
      }
    }
    super.onReady();
  }

  void onBack() {
    Get.back();
  }
}
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'badge.dart';

class BadgeMineModel extends BadgerProviderModel{

  void onChange(String? text) {
    if(UIUtils.isEmpty(text) || text == '0') {
      super.badgeText = null;
    } else {
      final int n = int.tryParse(text!) ?? 0;
      final String num = (n > 99)? 99.toString() : n.toString();
      super.badgeText = num;
    }
    notifyListeners();
  }
}
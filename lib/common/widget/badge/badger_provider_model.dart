
import 'package:dev_template_flutter/common/utils/utils.dart';

class BadgerProviderModel with ChangeNotifier {

  String? badgeText;
//
// void onChange(String? text) {
//   if(UIUtils.isEmpty(text)) {
//     _text = '';
//   } else {
//     final int n = int.tryParse(text!) ?? 0;
//     final String num = (n > 99)? 99.toString() : n.toString();
//     _text = num;
//   }
//   notifyListeners();
// }
}
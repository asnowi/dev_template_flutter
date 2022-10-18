
import 'package:get/get.dart';

class UIUtils {

  static bool isEmpty(Object? o) {
    if(o == null) return true;
    return GetUtils.isBlank(o)?? true;
  }
}
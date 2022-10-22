
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class UIUtils {

  static bool isEmpty(Object? o) {
    if(o == null) return true;
    return GetUtils.isBlank(o)?? true;
  }

  static bool isNotNull(Object? o) {
    if(o == null) return false;
    return true;
  }


  static Future<bool> openSettings() async {
    return openAppSettings();
  }
}
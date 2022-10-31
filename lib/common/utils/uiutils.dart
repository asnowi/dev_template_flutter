
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
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


  static IconButton onAppBarBack({VoidCallback? onBack}) {
    return IconButton(
      onPressed: (){
        if(onBack != null) {
          onBack();
        }
      },
      splashRadius: AppDimens.backRadius,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black87,
        size: 18,
      ),
    );
  }
}
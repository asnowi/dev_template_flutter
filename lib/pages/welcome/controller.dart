
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/config/config.dart';
import 'package:dev_template_flutter/common/router/router.dart';
import 'package:dev_template_flutter/common/service/service.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

class WelcomeController extends BaseGetController{

  @override
  void onReady() {
    super.onReady();
  }

  void toHome() {
    StorageUtil().setBool(SaveInfoKey.FIRST_OPEN, true);
    ConfigService.to.isHomeOpen = true;
    Get.offAndToNamed(AppRoutes.HOME);
  }
}
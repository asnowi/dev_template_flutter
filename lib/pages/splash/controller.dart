import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/router/app_routes.dart';
import 'package:dev_template_flutter/common/service/service.dart';

class SplashController extends BaseGetController{

  @override
  void onReady() {
    super.onReady();
    launchTarget();
  }

  void launchTarget() {
    if(ConfigService.to.isHomeOpen) {
      Get.offAndToNamed(AppRoutes.HOME);
      // Get.offAndToNamed(AppRoutes.WELCOME);
    } else {
      Get.offAndToNamed(AppRoutes.WELCOME);
    }
  }
}
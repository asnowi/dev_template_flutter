
import 'package:dev_template_flutter/common/base/base.dart';

class LoginController extends BaseGetController{

  void onFinish() {
    Get.back(result: {'result': false});
  }
}
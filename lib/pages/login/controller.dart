
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/toast.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

class LoginController extends BaseGetController{

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool isAccount = false;
  void setAccount(bool isAccount) {
    this.isAccount = isAccount;
    update(['account']);
  }

  bool isPassword = false;
  void setPassword(bool isPassword) {
    this.isPassword = isPassword;
    update(['password']);
  }

  bool isEye = true;
  void setEye(){
    isEye = !isEye;
    update(['password']);
  }

  bool isAgree = true;
  void setAgree(bool isAgree) {
    this.isAgree = isAgree;
    update(['agree']);
  }

  void onHelp() {
    ToastUtils.show('帮助');
  }

  void onFinish() {
    Get.back(result: {'result': false});
  }
}
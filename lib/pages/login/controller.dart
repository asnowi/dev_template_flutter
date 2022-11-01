
import 'package:dev_template_flutter/common/api/api.dart';
import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/config/config.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:dev_template_flutter/common/entity/entity.dart';
import 'package:dev_template_flutter/common/service/config_service.dart';
import 'package:dev_template_flutter/common/service/service.dart';
import 'package:dev_template_flutter/common/utils/toast.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

class LoginController extends BaseGetController{

  late LoadingButton loadingButton;

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

  void onFinish({ bool? isSuccess }) {
    Get.back(result: {'result': isSuccess?? false});
  }


  @override
  void onInit() {
    loadingButton = LoadingButton(text: '登录', width: 0.82.sw,height: 52.h,textStyle: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'FZDaLTJ'),onPressed: (BuildContext context) {
      final String account = accountController.text;
      if(account.isEmpty) {
        ToastUtils.show('请输入账号!');
        return;
      }
      final String password = passwordController.text;
      if(password.isEmpty) {
        ToastUtils.show('请输入密码!');
        return;
      }

      if(!isAgree){
        ToastUtils.show('请阅读并同意用户使用协议和隐私条款!');
        return;
      }

      KeyboardUtils.hideKeyboard();
      loadingButton.onLoading();
      LogUtils.GGQ('--账号:--->${account}');
      LogUtils.GGQ('--密码:--->${password}');
      FocusScope.of(context).unfocus();

      ApiService.login(account, password).then((value) async{
        LogUtils.GGQ('------登录结果:------>>>${value}');
        if(ResponseUtils.isSuccess(value.code)) {
          LogUtils.GGQ('------登录code:------>>>${value.code}');
          final entity = LoginEntity.fromJson(value.data);
          final User user = User();
            user.userId = entity.userId;
            user.token = entity.token;
            user.username = entity.username;
            user.nickname = entity.nickname;
            user.phone = entity.phone;
            user.avatarImg = entity.avatarUrl;

          StorageUtil().setJSON(SaveInfoKey.TOKEN, entity.token);

          final int? result = await Global.dbUtil?.saveUser(user);
          if(result != null && result >= 0) {
            UserService.to.getUser();
            onFinish(isSuccess: true);
          } else {
            ToastUtils.showBar('保存用户信息失败！');
          }
        } else {
          ToastUtils.showBar(ResponseUtils.getMessage(value.message));
        }
      }).whenComplete(() => {
        loadingButton.onCancel()
      });

      // ApiService.login(account, password).then((value) async{
      //   LogUtils.GGQ('------登录结果:------>>>${value}');
      //   if(ResponseUtils.isSuccess(value.code)) {
      //     final entity = LoginEntity.fromJson(value.data['user']);
      //     final User user = User();
      //     user.userId = entity.userId;
      //     user.token = entity.token;
      //     user.username = entity.username;
      //     user.phone = entity.phone;
      //     user.avatarImg = entity.avatarUrl;
      //
      //     StorageUtil().setJSON(SaveInfoKey.TOKEN, entity.token);
      //
      //     LogUtils.GGQ('------登录结果:------>>>${user.username}');
      //     LogUtils.GGQ('------登录结果:------>>>${entity.username}');
      //
      //     final int? result = await Global.dbUtil?.saveUser(user);
      //     if(result != null && result >= 0) {
      //       Global.user = Global.dbUtil?.getUser();
      //       EventBusUtils.send<CommonEvent>(CommonEvent(EventCode.EVENT_LOGIN));
      //       Get.back();
      //     } else {
      //       ToastUtils.showBar('保存用户信息失败！');
      //     }
      //   } else {
      //     ToastUtils.showBar(ResponseUtils.getMessage(value.message));
      //   }
      // }).whenComplete(() => {
      //   loadingButton.onCancel()
      // });
    });
    super.onInit();
  }
}
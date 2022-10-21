import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:dev_template_flutter/common/router/router.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';

class MineController extends BaseGetController{

  void onBadgeChange(BuildContext context,String num) {
    context.read<BadgeMineModel>().onChange(num);
  }

  final ValueNotifier<User?> user = ValueNotifier(Global.user);


  void onChangeUser() {
    user.value = Global.user;
  }
  @override
  void onReady() {
    onChangeUser();
    super.onReady();
  }


  void onLogin() {
    // user.value = User(userId: '1',phone: '13777777777',username: 'ggq',token: '1234567890',avatarImg: '');
    Get.toNamed(AppRoutes.LOGIN)?.then((value) => {
      LogUtils.GGQ('====onLogin====>>${value.toString()}'),
      onChangeUser()
    });
  }



  void onLogout() {
    TipDialog.show(() {
      user.value = null;
      Global.user = null;
      Global.dbUtil?.clearUser();
      TipDialog.dismiss();
    },title: '退出登录',content: '请确定要退出该账号?',confirm: '退出',cancel: '取消');
  }

  void onUserInfo() {
    Get.toNamed(AppRoutes.USER_INFO);
  }
}
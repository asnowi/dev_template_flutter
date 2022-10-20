import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:dev_template_flutter/common/router/router.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';

class MineController extends BaseGetController{

  void onBadgeChange(BuildContext context,String num) {
    context.read<BadgeMineModel>().onChange(num);
  }

  final ValueNotifier<User?> user = ValueNotifier(Global.user);

  @override
  void onReady() {
    user.value = Global.user;
    super.onReady();
  }


  void onLogin() {
    // user.value = User(userId: '1',phone: '13777777777',username: 'ggq',token: '1234567890',avatarImg: '');
    Get.toNamed(AppRoutes.LOGIN)?.then((value) => {
      LogUtils.GGQ('====onLogin====>>${value.toString()}')
    });
  }

  void onLogout() {
    user.value = null;
  }

  void onUserInfo() {
    ToastUtils.show('个人信息');
  }
}
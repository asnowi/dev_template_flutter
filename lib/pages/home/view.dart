import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter/services.dart';


import 'home.dart';

class HomeView extends BaseGetView<HomeController> {

  HomeView({super.key});

  DateTime? _popTime;




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('home'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onWillPop: () async {
        if(_popTime == null || DateTime.now().difference(_popTime!) > const Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          _popTime = DateTime.now();
          // ToastUtils.showToast('再按一次退出');
          ToastUtils.showBar('再按一次退出！');
          return false;
        }
        // 退出app
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
    );
  }
}
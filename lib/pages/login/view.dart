
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'login.dart';

class LoginView extends BaseGetView<LoginController> {

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,// 解决键盘顶起页面
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              child: Text('login'),
            )
          ],
        )
    );
  }

}

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'login.dart';

class LoginView extends BaseGetView<LoginController> {

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,// 解决键盘顶起页面
        body: Stack(
          alignment: Alignment.center,
          children: [
            _buildPlayer(context),
            _buildAction(context),
            _buildContent(),
            _buildAgreement()
          ],
        )
    );
  }

  Widget _buildPlayer(BuildContext context) {
    return const BobbleView();
  }

  Widget _buildAction(BuildContext context) {
    return Positioned(
        top: 20.h,
        child: SizedBox(
          width: getWidth(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => controller.onFinish(),
                splashRadius: AppDimens.backRadius,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('帮助?', style: TextStyle(color: Colors.white, fontSize: 14.sp)))
            ],
          ),
        )
    );
  }

  Widget _buildContent() {
    return Text('');
  }
  Widget _buildAgreement(){
    return Text('');
  }
}

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:flutter/gestures.dart';

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
                  onPressed: () => controller.onHelp(),
                  child: Text('帮助?', style: TextStyle(color: Colors.white, fontSize: 14.sp)))
            ],
          ),
        )
    );
  }

  Widget _buildInputAccount(){
    // const String _phone = '13717591366';
    // if(_phone.isNotEmpty){
    //   controller.accountController.text = _phone;
    //   controller.setAccount(controller.accountController.text.isNotEmpty);
    // }
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 52.h,
          maxWidth: 0.82.sw
      ),
      child: GetBuilder<LoginController>(
          id: 'account',
          builder: (_) => TextField(
            controller: controller.accountController,
            maxLines: 1,
            autocorrect: true,//是否自动更正
            // autofocus: true,//是否自动对焦
            textAlign: TextAlign.start,//文本对齐方式
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              hintText: '请输入手机号',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              prefixIcon: const Icon(Ionicons.tablet_portrait_sharp,color: Colors.blueAccent,size: 16),
              suffixIcon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.isAccount? IconButton(icon: const Icon(Icons.close,color: Colors.blueAccent, size: 16), onPressed: (){
                  controller.accountController.clear();
                  controller.setAccount(false);
                }): const SizedBox(),
              ),
              // contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.white60,
            ),
            onChanged: (text) {//内容改变的回调
              LogUtils.GGQ('-----账号------>>${text}');
              controller.setAccount(text.isNotEmpty);
            },
            onSubmitted: (text) {//内容提交(按回车)的回调
              LogUtils.GGQ('phone onSubmitted:${text}');
            },
          )
      ),
    );
  }

  Widget _buildInputPassword() {
// const String _password = '11111111';
    // if(_password.isNotEmpty){
    //   controller.passwordController.text = _password;
    //   controller.setPassword(controller.passwordController.text.isNotEmpty);
    // }
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 52.h,
          maxWidth: 0.82.sw
      ),
      child: GetBuilder<LoginController>(
        id: 'password',
        builder: (_) => TextField(
          controller: controller.passwordController,
          maxLines: 1,
          autocorrect: true,//是否自动更正
          // autofocus: true,//是否自动对焦
          textAlign: TextAlign.start,//文本对齐方式
          obscureText: controller.isEye,//是否是密码
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            hintText: '请输入密码',
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            prefixIcon: const Icon(Ionicons.lock_closed,color: Colors.blueAccent,size: 16),
            suffixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.isPassword? IconButton(
                  icon: controller.isEye? const Icon(Ionicons.eye_off,color: Colors.blueAccent,size: 16): const Icon(Ionicons.eye,color: Colors.blueAccent,size: 16), onPressed: (){
                controller.setEye();
              }): const SizedBox(),
            ),
            // contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white60,
          ),
          onChanged: (text) {//内容改变的回调
            LogUtils.GGQ('-----密码------>>${text}');
            controller.setPassword(text.isNotEmpty);
          },
          onSubmitted: (text) {//内容提交(按回车)的回调
            LogUtils.GGQ('password onSubmitted:${text}');
          },
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return controller.loadingButton;
  }
  
  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInputAccount(),
        SizedBox(height: 20.h),
        _buildInputPassword(),
        SizedBox(height: 30.h),
        _buildLogin(),
        SizedBox(height: 2.h),
        _buildRegisterAndForgotPassword(),
      ],
    );
  }


  Widget _buildRegisterAndForgotPassword() {
    return SizedBox(
      width: 0.82.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: (){},
            child: Text('立即注册',style: TextStyle(fontSize: 14.sp,color: Colors.blueAccent.shade100)),
          ),
          MaterialButton(
            onPressed: (){
            },
            child: Text('忘记密码?',style: TextStyle(fontSize: 14.sp,color: Colors.blueAccent.shade100)),
          ),
        ],
      ),
    );
  }

  Widget _buildAgreement(){
    return Positioned(
      bottom: 10.h,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () => controller.setAgree(!controller.isAgree),
                splashColor: Colors.blueGrey.shade100,
                highlightColor: Colors.blueGrey.shade50,
                elevation: 4.0,
                shape: const CircleBorder(),
                child: GetBuilder<LoginController>(
                  id: 'agree',
                  builder: (_) => controller.isAgree? const Icon(Icons.radio_button_on,size: 18,color: Colors.blueAccent,): const Icon(Icons.radio_button_on,size: 18,color: Colors.grey,),
                ),
              ),
            ),
            RichText(
          text: TextSpan(
              text: '我已认真阅读并同意',
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
              children: [
                TextSpan(
                    text: '《用户使用协议》',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer() ..onTap = () {
                      ToastUtils.show('用户使用协议');
                    }
                ),
                TextSpan(
                    text: '及',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontStyle: FontStyle.italic)),
                TextSpan(
                    text: '《隐私条款》',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer() ..onTap = () {
                      ToastUtils.show('隐私条款');
                    }
                ),
              ]
          ),
        )
          ],
        ),
      ),
    );
  }
}
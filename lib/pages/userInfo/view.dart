import 'package:dev_template_flutter/common/base/base.dart';
import 'package:flutter/material.dart';

import 'userInfo.dart';

class UserInfoView extends BaseGetView<UserInfoController>{
  UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
      ),
      body: Center(child: TextButton(onPressed: () => controller.onImagePicker(context), child: Text('相册'))),
    );
  }

}
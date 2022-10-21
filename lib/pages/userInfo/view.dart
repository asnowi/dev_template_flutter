import 'package:dev_template_flutter/common/base/base.dart';
import 'package:flutter/material.dart';

import 'userInfo.dart';

class UserInfoView extends BaseGetView<UserInfoController>{
  UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Center(child: Text('用户页')),
    );
  }

}
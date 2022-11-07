
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'setting.dart';

class SettingView extends BaseGetView<SettingController> {

  SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('setting'),
    );
  }

}
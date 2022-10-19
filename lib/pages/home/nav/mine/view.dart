import 'dart:math';

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'mine.dart';

class MineView extends BaseGetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){
        controller.onBadgeChange(context, Random().nextInt(200).toString());
      }, child: Text('我的')),
    );
  }
}

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/refresh/refresh.dart';

import 'test.dart';

class TestView extends BaseGetView<TestController> {

  TestView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Refresh(loadState: controller.loadState, controller: controller.refreshController, child: Center(
      child: Container(
        child: Text('test'),
      ),
    ));
  }

}
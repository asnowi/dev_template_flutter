import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'main.dart';

class MainView extends BaseGetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(child: Center(
      child: TextButton(onPressed: () => controller.onBadgeChange(context,null), child: const Text('首页')),
    ));
  }
}
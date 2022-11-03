import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'mine.dart';
import 'widget/widget.dart';

class MineView extends BaseGetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: GetBuilder<MineController>(
          id: 'user',
          builder: (_) => Global.user == null? UnLoginWidget(controller: controller) : OnUserWidget(controller: controller),
        )
    ));
  }
}

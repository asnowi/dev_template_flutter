import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'main.dart';

class MainView extends BaseGetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){
        controller.onBadgeChange(context,null);
      }, child: Text('首页')),
    );
  }
}
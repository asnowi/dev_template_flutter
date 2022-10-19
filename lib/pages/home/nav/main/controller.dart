import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';

class MainController extends BaseGetController{


  void onBadgeChange(BuildContext context,String? num) {
    context.read<BadgeMineModel>().onChange(num);
  }
}

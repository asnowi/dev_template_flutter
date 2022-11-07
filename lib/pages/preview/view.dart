import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'preview.dart';
import 'widget/widget.dart';

class PreviewView extends BaseGetView<PreviewController> {

  PreviewView({Key? key});

  @override
  Widget build(BuildContext context) {
    return PreviewWidget(controller: controller);
  }

}
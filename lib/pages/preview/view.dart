import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'preview.dart';
import 'widget/widget.dart';

class PreviewView extends BaseGetView<PreviewController> {

  PreviewView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PreviewWidget(controller: controller),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 25.0),
            child: Positioned(
                child: UIUtils.onAppBarCircleBack(onBack: () => controller.onBack(),iconColor: Colors.white)),
          ),
        ],
      ),
    );
  }

}
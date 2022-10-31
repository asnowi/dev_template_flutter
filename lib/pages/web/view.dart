
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/web/web_wrapper.dart';

import 'web.dart';

class WebView extends BaseGetView<WebController> {
  WebView({super.key});

  // final String url = "https://www.baidu.com";
  final String url = "https://threejs.org";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('浏览器'),
            leading: UIUtils.onAppBarBack(onBack: () => controller.onBack())),
        body: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return WebWrapper(url, true);
  }
}
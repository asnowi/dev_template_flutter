import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter_hms_scan_kit/flutter_hms_scan_kit.dart';
import 'package:flutter_hms_scan_kit/scan_result.dart';

import 'scanner.dart';

class ScannerView extends BaseGetView<ScannerController> {
  ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('华为扫码'),
          leading: UIUtils.onAppBarBack(onBack: () => controller.onBack())),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<ScannerController>(
              id: 'scan',
              builder: (_) => Text(
                controller.scanResult?.value ?? '',
                style: TextStyle(fontSize: 22.sp, color: Colors.blueAccent),
              ),
            ),
            TextButton(
              onPressed: () async {
                ScanResult? scanResult = await FlutterHmsScanKit.scan;
                if (scanResult != null) {
                  controller.onScanResult(scanResult);
                }
              },
              child: const Text('点击扫码'),
            ),
          ],
        ),
      ),
    );
  }
}

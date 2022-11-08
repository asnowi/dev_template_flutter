import 'dart:io';

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends BaseGetController with WidgetsBindingObserver{

  Barcode? result;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  @override
  void onInit() async {
    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
    // 移除观察者
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed) {
      if (Platform.isAndroid) {
        qrViewController?.pauseCamera();
      } else if (Platform.isIOS) {
        qrViewController?.resumeCamera();
      }
    }
  }

  void onBack() {
    Get.back();
  }
}
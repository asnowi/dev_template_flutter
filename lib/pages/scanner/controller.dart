import 'dart:io';

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter_hms_scan_kit/scan_result.dart';

class ScannerController extends BaseGetController with WidgetsBindingObserver{

  ScanResult? scanResult;

  @override
  void onInit() async {
    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    // 移除观察者
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed) {
      if (Platform.isAndroid) {
      } else if (Platform.isIOS) {
      }
    }
  }

  void onBack() {
    Get.back();
  }

  void onScanResult(ScanResult result) {
    this.scanResult = result;
    AudioUtils().onPlay();
    update(['scan']);
  }
}
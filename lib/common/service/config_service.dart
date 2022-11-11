import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/config/config.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService{

  static ConfigService get to => Get.find();

  bool isHomeOpen = false;

  Locale locale = const Locale('en', 'US');

  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];


  // 是否黑暗模式
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 切换模式
  void switchThemeModel() {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppThemes.dark : AppThemes.light,
    );
  }


  // 是否允许监听网络状态
  final bool _hasNetworkState = true;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void onInit() async{
    isHomeOpen = StorageUtil().getBool(SaveInfoKey.FIRST_OPEN)?? false;
    LogUtils.GGQ('isHomeOpen-->${isHomeOpen}');
    if(_hasNetworkState && (Global.isAndroid || Global.isIOS)) {
      _initConnectivity();
    }
    super.onInit();
  }

  void _initConnectivity() async {
    try {
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {
        if(_connectionStatus.name != event.name) {
          _connectionStatus = event;
          _sendNetworkStatus(_connectionStatus);
        }
      });
      ConnectivityResult result = await _connectivity.checkConnectivity();
      if(result.name != _connectionStatus.name) {
        _connectionStatus = result;
        _sendNetworkStatus(_connectionStatus);
      }
    } catch (e) {
      LogUtils.GGQ('监听网络状态异常: ${e}');
    }
  }

  void _sendNetworkStatus(ConnectivityResult status) {
    LogUtils.GGQ('======_sendNetworkStatus===============>>>${status.name}');
    EventBusUtils.send<CommonEvent>(CommonEvent(EventCode.EVENT_NETWORK,message: status.name));
  }

  Future<String> getVersionName() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getVersionCode() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  Future<String> getPackageName() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  @override
  void onClose() {
    if(_hasNetworkState && (Global.isAndroid || Global.isIOS)) {
      _connectivitySubscription?.cancel();
    }
    super.onClose();
  }
}
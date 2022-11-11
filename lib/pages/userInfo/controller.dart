import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UserInfoController extends BaseGetController with WidgetsBindingObserver {

  bool isOpenSetting = false;

  BuildContext? context;

  @override
  bool get hasNetworkState => true;

  @override
  void onInit() async {
    LogUtils.GGQ('-------onInit----->>');
    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
    isOpenSetting = false;
    super.onInit();
  }

  @override
  void onReady() {
    LogUtils.GGQ('-------onReady----->>');
    super.onReady();
  }

  @override
  void onClose() {
    LogUtils.GGQ('-------onClose----->>');
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    LogUtils.GGQ('--------生命周期------state----->${state.name}');

    if(state.name == AppLifecycleState.resumed.name) { // 应用可见并可响应用户操作
      LogUtils.GGQ('--------生命周期----------->resumed');
      if(context != null && isOpenSetting) {
        onImagePicker(context!);
      }
    } else if(state == AppLifecycleState.inactive) { // 用户可见，但不可响应用户操作
      LogUtils.GGQ('--------生命周期----------->inactive');

    } else if(state == AppLifecycleState.paused) { // 已经暂停了，用户不可见、不可操作
      LogUtils.GGQ('--------生命周期----------->paused');

    } else if(state == AppLifecycleState.detached) { // 表示flutter引擎脱离了宿主view
      LogUtils.GGQ('--------生命周期----------->detached');
    }
   }

  void onBack() {
    Get.back();
  }

  void onImagePicker(BuildContext context) {
    this.context = context;
    isOpenSetting = false;
    PermissionUtil.checkPermissions([Permission.photos,Permission.camera,Permission.storage],onSuccess: () async{
      AssetPickerConfig pickerConfig = AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.image,
        textDelegate: const AssetPickerTextDelegate(),
        pickerTheme: AssetPicker.themeData(Colors.blueAccent,
            light: true)
      );
      final List<AssetEntity>? result = await AssetPicker.pickAssets(context,pickerConfig: pickerConfig);
      if(result !=null && result.isNotEmpty) {
        ToastUtils.show('选择的图片-->${result.length}');
      }
    },onFailed: () {
      PermissionDialog.show(() => onImagePicker(context),onCancel: () => ToastUtils.show('取消'));
    },onSetting: () {
      UIUtils.openSettings();
      isOpenSetting = true;
    });
  }

  @override
  void networkChanged(String status) {
    super.networkChanged(status);
    ToastUtils.show('userInfo->${status}');
  }
}
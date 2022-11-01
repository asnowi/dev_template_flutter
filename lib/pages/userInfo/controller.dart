
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:dev_template_flutter/common/service/service.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UserInfoController extends BaseGetController with WidgetsBindingObserver {

  bool isOpenSetting = false;

  BuildContext? context;

  @override
  void onInit() async {
    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
    isOpenSetting = false;
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
    if(state == AppLifecycleState.resumed && isOpenSetting) {
      if(context != null) {
        onImagePicker(context!);
      }
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
        pickerTheme: AssetPicker.themeData(Colors.lightBlueAccent,
            light: true)
      );
      final List<AssetEntity>? result = await AssetPicker.pickAssets(context,pickerConfig: pickerConfig);
      if(result !=null && result.isNotEmpty) {
        ToastUtils.show('选择的图片-->${result.length}');
      }
    },onFailed: () {
      PermissionDialog.show(context,onConfirm: () => onImagePicker(context),onCancel: () => ToastUtils.show('取消'));
    },onSetting: () {
      UIUtils.openSettings();
      isOpenSetting = true;
    });
  }

}
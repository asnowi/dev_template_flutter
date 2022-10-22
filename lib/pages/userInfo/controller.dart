
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class UserInfoController extends BaseGetController with WidgetsBindingObserver {

  bool isOpenSetting = false;

  BuildContext? context;

  @override
  void onInit() {
    // 注册观察者
    WidgetsBinding.instance.addObserver(this);
    isOpenSetting = false;
    super.onInit();
  }

  @override
  void disposeId(Object id) {
    super.disposeId(id);
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



  void onImagePicker(BuildContext context) {
    this.context = context;
    isOpenSetting = false;
    PermissionUtil.checkPermissions([Permission.photos,Permission.camera,Permission.storage],onSuccess: () {

    },onFailed: () {
      PermissionDialog.show(context,onConfirm: () => onImagePicker(context),onCancel: () => ToastUtils.show('取消'));
    },onSetting: () {
      UIUtils.openSettings();
      isOpenSetting = true;
    });
  }
}
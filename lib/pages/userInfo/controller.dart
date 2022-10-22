
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class UserInfoController extends BaseGetController{


  void onImagePicker(BuildContext context) {
    PermissionUtil.checkPermissions([Permission.photos,Permission.camera,Permission.storage],onSuccess: () {
      ToastUtils.show('权限申请成功');
    },onFailed: () {
      PermissionDialog.show(context,onOk: () => onImagePicker(context),onCancel: () => ToastUtils.show('取消'));
    },onSetting: () {
      UIUtils.openSettings();
    });
  }
}
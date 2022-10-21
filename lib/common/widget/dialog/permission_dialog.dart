import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog {

  static show(BuildContext context,{String? title,String? cancel,String? setting}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('权限申请',style: TextStyle(fontSize: 14.sp,color: Colors.black87),),
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(title?? '您需要授权使用权限？',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
            ),
            actions: <Widget>[
              CupertinoDialogAction(child: Text(cancel?? '不同意',style: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
                Navigator.of(context).pop('cancel');
              },),
              CupertinoDialogAction(child: Text(setting?? '去设置',style: TextStyle(color: Colors.blue,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
                Navigator.of(context).pop('ok');
                openSetting();
              },),
            ],
          );
        }
    );
  }


  static Future<bool> openSetting() async{
    return await openAppSettings();
  }
}
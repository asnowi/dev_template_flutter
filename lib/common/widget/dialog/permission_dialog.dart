import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class PermissionDialog {

  static show(BuildContext context,{String? title,String? confirm,String? cancel,VoidCallback? onConfirm,VoidCallback? onCancel}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('权限申请',style: TextStyle(fontSize: 14.sp,color: Colors.black87),),
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(title?? '您需要授权使用权限！',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
            ),
            actions: <Widget>[
              CupertinoDialogAction(child: Text(cancel?? '取消',style: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
                Navigator.of(context).pop('cancel');
                if(onCancel != null) {
                  onCancel();
                }
              },),
              CupertinoDialogAction(child: Text(confirm?? '同意',style: TextStyle(color: Colors.blue,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
                Navigator.of(context).pop('confirm');
                if(onConfirm != null) {
                  onConfirm();
                }
              },),
            ],
          );
        }
    );
  }

}
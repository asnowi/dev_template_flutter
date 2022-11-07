import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class PermissionDialog {

  // static show(BuildContext context,{String? title,String? confirm,String? cancel,VoidCallback? onConfirm,VoidCallback? onCancel}) {
  //   showCupertinoDialog(
  //       context: context,
  //       builder: (context) {
  //         return CupertinoAlertDialog(
  //           title: Text('权限申请',style: TextStyle(fontSize: 14.sp,color: Colors.black87),),
  //           content: Padding(
  //             padding: const EdgeInsets.only(top: 10.0),
  //             child: Text(title?? '您需要授权使用权限！',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
  //           ),
  //           actions: <Widget>[
  //             CupertinoDialogAction(child: Text(cancel?? '取消',style: TextStyle(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
  //               Navigator.of(context).pop('cancel');
  //               if(onCancel != null) {
  //                 onCancel();
  //               }
  //             },),
  //             CupertinoDialogAction(child: Text(confirm?? '同意',style: TextStyle(color: Colors.blue,fontSize: 14.sp,fontWeight: FontWeight.bold),),onPressed: (){
  //               Navigator.of(context).pop('confirm');
  //               if(onConfirm != null) {
  //                 onConfirm();
  //               }
  //             },),
  //           ],
  //         );
  //       }
  //   );
  // }



  static void show(VoidCallback onConfirm,{String? title,String? content,String? confirm, String? cancel,VoidCallback? onCancel}) {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      _buildDialog(onConfirm,title: title,content: content,confirm: confirm,cancel: cancel,onCancel: onCancel),
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
      barrierDismissible: false,
    );
  }

  static Dialog _buildDialog(VoidCallback onConfirm,{String? title,String? content,String? confirm, String? cancel,VoidCallback? onCancel}){
    return Dialog(
        elevation: 2.0,
        backgroundColor: Colors.white,
        insetAnimationDuration: const Duration(seconds: 2),
        insetAnimationCurve: Curves.decelerate,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
        child: Container(
            width: getWidth(),
            height: 0.21.sh,
            child: Column(
              children: [
                Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
                    child: Text(title?? '温馨提示',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),)
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(content?? '权限申请',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
                    ),
                  ),
                ),
                const Divider(height: .2,color: Colors.grey,thickness: .2),
                Container(
                    height: 52.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 1,
                            child: TextButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18)),
                                )),
                              ),
                              onPressed: () => {
                                dismiss(),
                                onConfirm(),
                              },
                              child: Text(confirm?? '确定',style: const TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold)),
                            )
                        ),
                        const VerticalDivider(width: .2,color: Colors.grey,thickness: .2),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, double.maxFinite)),
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(18)),
                              )),
                            ),
                            onPressed: onCancel?? dismiss,
                            child: Text(cancel?? '取消', style: const TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold)),
                          ),)
                      ],
                    )
                )
              ],
            )
        )
    );
  }

  static void dismiss() {
    LogUtils.GGQ('====dismiss======>>>');
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
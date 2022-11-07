import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'dialog.dart';

class SubmitDialog extends BaseDialog{

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
            height: 0.28.sh,
            child: Column(
              children: [
                Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
                    child: Text(title?? '确认提交',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),)
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(content?? '请确认',style: TextStyle(color: Colors.black87,fontSize: 14.sp),),
                    ),
                  ),
                ),
                const Divider(height: .2,color: Colors.grey,thickness: .2),
                GetBuilder<DialogController>(
                    id: 'submit',
                    builder: (controller) => Container(
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
                                onPressed: controller.getLoading()? null: () => {
                                  onConfirm(),
                                  controller.onLoading(true)
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(controller.getLoading()? '请稍后...': confirm?? '提交',style: TextStyle(fontSize: 16, color: controller.getLoading()? Colors.blue[200]:Colors.blue,fontWeight: FontWeight.bold)),
                                    Visibility(
                                        visible: controller.getLoading(),
                                        maintainState: false,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 4.0),
                                          child: SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: SpinKitRing(
                                              color: Color(0xFF90CAF9),
                                              size: 13.0,
                                              lineWidth: 1.0,
                                            ),
                                          ),
                                        )
                                    )
                                  ],
                                )
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
                            onPressed: () => {
                              controller.onLoading(false),
                              if(onCancel != null) {
                                dismiss(),
                                onCancel()
                              } else {
                                dismiss()
                              },
                            },
                            child: Text(cancel?? '取消', style: TextStyle(fontSize: 16, color: controller.getLoading()? Colors.blue:Colors.blue,fontWeight: FontWeight.bold)),
                          ),)
                      ],
                    )
                ))
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
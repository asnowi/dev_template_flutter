package com.maple.dev_template_flutter.widget.dialog

import android.content.Context
import android.view.Gravity
import android.view.WindowManager
import com.blankj.utilcode.util.ScreenUtils
import com.maple.dev_template_flutter.widget.dialog.BaseDailog

abstract class BaseCenterDialog(context: Context,
                                width: Int = (ScreenUtils.getScreenWidth() * 0.82).toInt(),
                                height: Int = WindowManager.LayoutParams.WRAP_CONTENT,
                                gravity: Int = Gravity.CENTER,
                                style:Int,
                                isCancelable:Boolean = false):
    BaseDailog(context,width,height,gravity,style,isCancelable){

}
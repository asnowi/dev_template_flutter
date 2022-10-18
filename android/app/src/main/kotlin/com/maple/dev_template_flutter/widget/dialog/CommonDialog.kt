package com.maple.dev_template_flutter.widget.dialog

import android.content.Context
import android.os.Bundle
import android.view.WindowManager
import android.widget.Button
import android.widget.TextView
import com.maple.dev_template_flutter.R
import com.maple.zuiyou_app.utils.UIUtils

class CommonDialog(context: Context,
                   private val title: String = UIUtils.getString(R.string.common_tip),
                   private val content: String = "",
                   private val cancel: String = UIUtils.getString(R.string.common_text_cancel),
                   private val confirm: String = UIUtils.getString(R.string.common_text_confirm),
                   private val listener: OnClickListener,
                   isCancelable:Boolean = false,
                   height: Int = WindowManager.LayoutParams.WRAP_CONTENT
): BaseCenterDialog(context,isCancelable = isCancelable,height = height,style = R.style.CommonDialogStyle){
    override fun getLayoutId(): Int = R.layout.dialog_common
    override fun initData(savedInstanceState: Bundle?) {
        findViewById<TextView>(R.id.tv_title).let {
            it.text = title
        }

        findViewById<TextView>(R.id.tv_content).let {
            it.text = content
        }
        findViewById<Button>(R.id.btn_cancel).let {
            it.text = cancel
            it.setOnClickListener {
                this.onCancel()
                listener.onCancelClick()
            }
        }
        findViewById<Button>(R.id.btn_confirm).let {
            it.text = confirm
            it.setOnClickListener {
                listener.onConfirmClick()
            }
        }

    }

    interface OnClickListener{
        fun onCancelClick(){}
        fun onConfirmClick(){}
    }
}



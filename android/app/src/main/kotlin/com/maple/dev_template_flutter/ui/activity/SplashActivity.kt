package com.maple.dev_template_flutter.ui.activity

import android.content.Intent
import android.os.Bundle
import com.blankj.utilcode.util.SPUtils
import com.blankj.utilcode.util.ScreenUtils
import com.maple.dev_template_flutter.R
import com.maple.dev_template_flutter.app.config.Const
import com.maple.dev_template_flutter.base.BaseActivity
import com.maple.dev_template_flutter.widget.dialog.CommonDialog
import com.maple.zuiyou_app.utils.UIUtils


class SplashActivity: BaseActivity() {

    private val useDialog: CommonDialog by lazy {
        CommonDialog(this, UIUtils.getString(R.string.use_title), UIUtils.getString(R.string.use_content), "拒绝", "同意", object : CommonDialog.OnClickListener {
            override fun onCancelClick() {
                super.onCancelClick()
                useDialog.onCancel()
                onFinish()
            }

            override fun onConfirmClick() {
                super.onConfirmClick()
                SPUtils.getInstance().put(Const.SaveInfoKey.HAS_USE,true)
                useDialog.onCancel()
                launchHome()
            }
        }, false,height = (ScreenUtils.getScreenHeight() * 0.62).toInt())
    }

    override fun getLayoutId(): Int = R.layout.activity_splash

    override fun initData(savedInstanceState: Bundle?) {
        if(SPUtils.getInstance().getBoolean(Const.SaveInfoKey.HAS_USE)) {
            launchHome()
        } else {
            useDialog.show()
        }
    }

    private fun launchHome() {
        startActivity(Intent(this,HomeActivity::class.java))
        this.finish()
    }
}

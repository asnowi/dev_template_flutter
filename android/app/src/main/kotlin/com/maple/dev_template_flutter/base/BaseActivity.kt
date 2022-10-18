package com.maple.dev_template_flutter.base

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

abstract class BaseActivity: AppCompatActivity() {
    /// 布局
    abstract fun getLayoutId(): Int

    open fun initView(savedInstanceState: Bundle?){}

    abstract fun initData(savedInstanceState: Bundle?): Unit


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(getLayoutId())
        initView(savedInstanceState)
        initData(savedInstanceState)
    }

    /***
     * 关闭页面
     */
    open fun onFinish() {
        this.finish()
    }

}
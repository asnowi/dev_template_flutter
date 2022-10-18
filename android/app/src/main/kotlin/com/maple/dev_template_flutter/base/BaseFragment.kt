package com.maple.zuiyou_app.base

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment

abstract class BaseFragment: Fragment() {

    abstract fun getLayoutId(): Int

    abstract fun initData(savedInstanceState: Bundle?): Unit

    open fun initView(view: View, savedInstanceState: Bundle?){}


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
//        return super.onCreateView(inflater, container, savedInstanceState)
        return setContentLayout(inflater, container, savedInstanceState)
    }

    open fun setContentLayout(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return inflater.inflate(getLayoutId(), container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        this.initView(view,savedInstanceState)
        this.initData(savedInstanceState)
    }
}
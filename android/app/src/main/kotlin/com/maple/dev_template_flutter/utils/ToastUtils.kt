package com.maple.dev_template_flutter.utils

import com.blankj.utilcode.util.ToastUtils as Toast

class ToastUtils {

    companion object {
        @JvmStatic
        fun showToast(s: String?) {
            Toast.showShort(s)
        }
    }
}
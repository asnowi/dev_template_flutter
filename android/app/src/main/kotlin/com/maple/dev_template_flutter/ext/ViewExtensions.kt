package com.maple.dev_template_flutter.ext

import android.app.Service
import android.text.Editable
import android.text.TextWatcher
import android.view.KeyEvent
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.EditText
import android.widget.TextView
import androidx.recyclerview.widget.LinearSmoothScroller
import androidx.recyclerview.widget.RecyclerView
import com.maple.dev_template_flutter.app.MyApplication
import com.maple.zuiyou_app.utils.UIUtils

fun View.toVisible() {
    if(this.visibility == View.GONE){
        this.visibility = View.VISIBLE
    }
}

fun View.toGone() {
    if(this.visibility == View.VISIBLE){
        this.visibility = View.GONE
    }
}

fun View.toInvisible() {
    if(this.visibility == View.VISIBLE){
        this.visibility = View.INVISIBLE
    }
}

fun View.isGone() : Boolean {
    if(this.visibility == View.GONE) {
        return true
    }
    return false
}

fun View.isVisible(): Boolean {
    if(this.visibility == View.VISIBLE) {
        return true
    }
    return false
}

fun View.showKeyboard() {
    (MyApplication.instance.getSystemService(Service.INPUT_METHOD_SERVICE) as? InputMethodManager)
        ?.showSoftInput(this, 0)
}

fun View.hideKeyboard() {
    (MyApplication.instance.getSystemService(Service.INPUT_METHOD_SERVICE) as? InputMethodManager)
        ?.hideSoftInputFromWindow(this.windowToken, 0)
}

fun EditText.afterTextChanged(action: (String) -> Unit) {
    this.addTextChangedListener(object : TextWatcher {
        override fun afterTextChanged(s: Editable?) {
        }

        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
        }

        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            action(s.toString())
        }
    })
}



fun EditText.onShitActionKey(){
    this.setOnEditorActionListener(object : TextView.OnEditorActionListener {
        override fun onEditorAction(v: TextView?, actionId: Int, event: KeyEvent?): Boolean {
            return true
        }
    })
}

//是否快速点击了 true 是, false 否
fun View.isFastClick(): Boolean {
    return UIUtils.isFastClick()
}


// 滑动到指定位置，并使指定位置位于列表最上面
fun RecyclerView.scrollItemToTop(position: Int) {
    val smoothScroller: LinearSmoothScroller = object : LinearSmoothScroller(context) {
        override fun getVerticalSnapPreference(): Int {
            return SNAP_TO_START
        }
    }
    smoothScroller.targetPosition = position
    layoutManager?.startSmoothScroll(smoothScroller)
}

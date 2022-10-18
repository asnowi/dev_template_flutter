package com.maple.dev_template_flutter.app.config

class Const {

    object Path {
        val IMEI_PATH: String = android.os.Environment.getExternalStorageDirectory().toString() + "/android/imei.text"
    }

    object SaveInfoKey {
        const val HAS_USE = "hasUse"
    }

    object BundleKey {
        const val EXTRA_URL = "url"
        const val EXTRA_OBJ = "obj"
        const val EXTRA_INDEX = "index"
        const val EXTRA_ID = "id"
        const val EXTRA_TYPE = "type"
        const val EXTRA_NUMBER = "number"
        const val EXTRA_LIST = "list"
    }


    object RoleKey {
    }

    object EventCode {
    }

}
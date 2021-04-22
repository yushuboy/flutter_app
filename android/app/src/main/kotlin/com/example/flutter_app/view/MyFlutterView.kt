package com.example.flutter_app.view

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

class MyFlutterView(context: Context, messenger: BinaryMessenger, viewId: Int, args: Map<String, Any>?) : PlatformView {

    val textView: TextView = TextView(context)

    init {
        textView.text = "我是Android View"
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {

    }
}

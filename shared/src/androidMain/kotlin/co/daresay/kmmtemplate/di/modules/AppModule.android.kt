package co.daresay.kmmtemplate.di.modules

actual class PlatformName actual constructor() {
    actual val name: String = "Android ${android.os.Build.VERSION.SDK_INT}"
}

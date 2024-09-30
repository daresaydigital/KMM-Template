package co.daresay.kmmtemplate.data.storage.preferencies

import com.russhwolf.settings.NSUserDefaultsSettings
import com.russhwolf.settings.Settings
import platform.Foundation.NSUserDefaults

actual fun createSettings(): Settings {
    val delegate: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    return NSUserDefaultsSettings(delegate)
}

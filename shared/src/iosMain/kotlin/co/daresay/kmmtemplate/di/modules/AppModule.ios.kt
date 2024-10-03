package co.daresay.kmmtemplate.di.modules

import platform.UIKit.UIDevice

actual class PlatformName actual constructor() {
    actual val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}

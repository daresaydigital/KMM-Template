package co.daresay.kmmtemplate.data.storage.preferencies

import com.russhwolf.settings.Settings

const val LOCAL_SETTINGS_NAME = "Settings"

expect fun createSettings(): Settings

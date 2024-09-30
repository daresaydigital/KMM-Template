package co.daresay.kmmtemplate.data.storage.preferencies

import com.russhwolf.settings.Settings

class LocalPreferencesImpl(private val settings: Settings) : LocalPreferences {
    override fun getString(key: String, defaultValue: String): String {
        return settings.getString(key, defaultValue)
    }

    override fun setString(key: String, value: String) {
        settings.putString(key, value)
    }
}

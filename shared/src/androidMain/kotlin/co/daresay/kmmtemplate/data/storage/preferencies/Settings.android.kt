package co.daresay.kmmtemplate.data.storage.preferencies

import android.content.Context
import android.content.SharedPreferences
import com.russhwolf.settings.Settings
import com.russhwolf.settings.SharedPreferencesSettings

actual fun createSettings(): Settings {
    val delegate: SharedPreferences = SharedPreferencesProvider.sharedPreferences ?: throw IllegalStateException("SharedPreferences not initialized")
    return SharedPreferencesSettings(delegate)
}

//TODO replace this implementation after setup DI framework for providing dependencies
object SharedPreferencesProvider {
    var sharedPreferences: SharedPreferences? = null

    fun getInstance(context: Context): SharedPreferences {
        if (sharedPreferences == null) {
            sharedPreferences = context.getSharedPreferences(LOCAL_SETTINGS_NAME, Context.MODE_PRIVATE)
        }
        return sharedPreferences!!
    }
}

package co.daresay.kmmtemplate.data.storage.preferencies

interface LocalPreferences {

    fun getString(key: String, defaultValue: String): String

    fun setString(key: String, value: String)

    // TODO place other methode if need to store different type of data
}

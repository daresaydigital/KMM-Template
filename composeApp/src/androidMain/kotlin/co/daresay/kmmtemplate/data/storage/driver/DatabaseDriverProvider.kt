package co.daresay.kmmtemplate.data.storage.driver

import android.content.Context

actual object DatabaseDriverProvider {
    actual var driver: DatabaseDriverFactory? = null

    fun getInstance(context: Context): DatabaseDriverFactory {
        if (driver == null) {
            driver = DatabaseDriverFactoryImpl(context)
        }
        return driver!!
    }
}

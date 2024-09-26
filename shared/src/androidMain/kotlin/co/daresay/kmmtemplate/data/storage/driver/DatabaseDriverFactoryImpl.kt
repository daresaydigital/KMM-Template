package co.daresay.kmmtemplate.data.storage.driver

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver

class DatabaseDriverFactoryImpl(private val context: Context) : DatabaseDriverFactory {
    override fun createDriver(): SqlDriver {
        return AndroidSqliteDriver(DestructiveMigrationSchema, context, "AppDatabase.db")
    }
}

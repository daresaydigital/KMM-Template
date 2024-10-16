package co.daresay.kmmtemplate.data.storage.driver

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver
import co.daresay.kmmtemplate.data.storage.driver.DatabaseDriverFactory.Companion.DATABASE_NAME

class DatabaseDriverFactoryImpl(private val context: Context) : DatabaseDriverFactory {
    override fun createDriver(): SqlDriver {
        return AndroidSqliteDriver(DestructiveMigrationSchema, context, DATABASE_NAME)
    }
}

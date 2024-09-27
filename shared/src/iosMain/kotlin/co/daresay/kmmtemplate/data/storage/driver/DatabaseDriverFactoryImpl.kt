package co.daresay.kmmtemplate.data.storage.driver

import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.native.NativeSqliteDriver
import co.daresay.kmmtemplate.data.storage.driver.DatabaseDriverFactory.Companion.DATABASE_NAME

class DatabaseDriverFactoryImpl : DatabaseDriverFactory {
    override fun createDriver(): SqlDriver {
        return NativeSqliteDriver(DestructiveMigrationSchema, DATABASE_NAME)
    }
}

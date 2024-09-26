package co.daresay.kmmtemplate.data.storage.driver

import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.native.NativeSqliteDriver

class DatabaseDriverFactoryImpl : DatabaseDriverFactory {
    override fun createDriver(): SqlDriver {
        return NativeSqliteDriver(DestructiveMigrationSchema, "AppDatabase.db")
    }
}

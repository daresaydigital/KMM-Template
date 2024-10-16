package co.daresay.kmmtemplate.data.storage.driver

import app.cash.sqldelight.db.SqlDriver

interface DatabaseDriverFactory {

    fun createDriver(): SqlDriver

    companion object {
        const val DATABASE_NAME = "AppDatabase.db"
    }
}


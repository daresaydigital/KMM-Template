package co.daresay.kmmtemplate.data.storage.driver

import app.cash.sqldelight.db.SqlDriver

interface DatabaseDriverFactory {
    fun createDriver(): SqlDriver
}


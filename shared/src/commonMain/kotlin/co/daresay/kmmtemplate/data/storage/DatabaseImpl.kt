package co.daresay.kmmtemplate.data.storage

import co.daresay.kmmtemplate.data.storage.adapters.DateColumnAdapter
import co.daresay.kmmtemplate.data.storage.driver.DatabaseDriverFactory
import co.daresay.kmmtemplate.database.AppDatabase
import co.daresay.kmmtemplate.database.User

class DatabaseImpl(driverFactory: DatabaseDriverFactory) : Database {

    private val database: AppDatabase =
        AppDatabase(driverFactory.createDriver(), UserAdapter = User.Adapter(DateColumnAdapter()))

    override fun insertUser(user: User) {
        database.appDatabaseQueries.insertUser(id = user.id, user_name = user.user_name, addedAt = user.addedAt)
    }

    override fun getAllUsers(): List<User> {
        return database.appDatabaseQueries.getAllUsers().executeAsList()
    }
}

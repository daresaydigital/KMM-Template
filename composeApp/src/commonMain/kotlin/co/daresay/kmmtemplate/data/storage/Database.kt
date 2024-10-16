package co.daresay.kmmtemplate.data.storage

import co.daresay.kmmtemplate.database.User

interface Database {

    fun insertUser(user: User)

    fun getAllUsers(): List<User>
}

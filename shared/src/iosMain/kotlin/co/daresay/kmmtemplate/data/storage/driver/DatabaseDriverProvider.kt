package co.daresay.kmmtemplate.data.storage.driver

actual object DatabaseDriverProvider {
    actual var driver: DatabaseDriverFactory? = DatabaseDriverFactoryImpl()
}

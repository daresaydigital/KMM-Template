package co.daresay.kmmtemplate.data.storage.driver

/**
 * Simple implementation for providing DatabaseDriverFactory. Replace it on direct creation driver
 * factory after DI integration
 */
expect object DatabaseDriverProvider {
    var driver: DatabaseDriverFactory?
}

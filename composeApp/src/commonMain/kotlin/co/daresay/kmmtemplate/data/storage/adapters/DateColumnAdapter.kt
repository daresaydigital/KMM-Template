package co.daresay.kmmtemplate.data.storage.adapters

import app.cash.sqldelight.ColumnAdapter

/**
 * Simple adapter for converting data that passed in column. Replace it on your own implementation
 * or delete
 */
class DateColumnAdapter : ColumnAdapter<DateTypeClass, String> {
    override fun decode(databaseValue: String): DateTypeClass {
        return databaseValue
    }

    override fun encode(value: DateTypeClass): String {
        return value
    }
}

typealias DateTypeClass = String

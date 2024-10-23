package co.daresay.kmmtemplate.data.networking

import io.ktor.client.plugins.logging.DEFAULT
import io.ktor.client.plugins.logging.Logger

actual val requestLogger: Logger
    get() = Logger.DEFAULT

package co.daresay.kmmtemplate.data.networking

import io.ktor.client.plugins.logging.ANDROID
import io.ktor.client.plugins.logging.Logger

actual val requestLogger: Logger
    get() = Logger.ANDROID

package co.daresay.kmmtemplate.data.networking

import io.ktor.client.HttpClient
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.logging.LogLevel
import io.ktor.client.plugins.logging.Logging

class HttpClientProvider {

    val httpClient: HttpClient = HttpClient {
        install(Logging) {
            logger = requestLogger
            level = LogLevel.ALL
        }

        install(HttpTimeout) {
            socketTimeoutMillis = 60_000
            requestTimeoutMillis = 60_000
        }
    }
}

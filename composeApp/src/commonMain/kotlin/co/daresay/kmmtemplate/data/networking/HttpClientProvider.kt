package co.daresay.kmmtemplate.data.networking

import co.daresay.kmmtemplate.data.networking.converters.InstantSerializer
import io.ktor.client.HttpClient
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.logging.LogLevel
import io.ktor.client.plugins.logging.Logging
import io.ktor.serialization.kotlinx.json.json
import kotlinx.datetime.Instant
import kotlinx.serialization.json.Json
import kotlinx.serialization.modules.SerializersModule

class HttpClientProvider {

    val httpClient: HttpClient = HttpClient {
        install(ContentNegotiation) {
            json(
                Json {
                    ignoreUnknownKeys = true
                    useAlternativeNames = false
                    serializersModule = SerializersModule {
                        contextual(Instant::class, InstantSerializer)
                    }
                },
            )
        }
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

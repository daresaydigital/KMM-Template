package co.daresay.kmmtemplate

import co.daresay.kmmtemplate.data.networking.HttpClientProvider
import io.ktor.client.call.body
import io.ktor.client.request.get
import kotlinx.datetime.Instant
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

class Greeting {
    private val client = HttpClientProvider().httpClient

    suspend fun greet(): String {
        val response = client.get("https://dev.to/stories/feed/?page=0&class_name=Article").body<List<Article>>()
        return response.joinToString(", "){ it.publishedTimestamp.toString()}
    }
}

@Serializable
data class Article(
    val id: Int,
    val title: String,
    @SerialName("published_timestamp")
    val publishedTimestamp: Instant,
)

package co.daresay.kmmtemplate.data.networking.graphql

import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.network.http.LoggingInterceptor

object GraphQLProvider {
    val apolloClient = ApolloClient.Builder()
        .serverUrl("https://apollo-fullstack-tutorial.herokuapp.com/graphql")
        .addHttpInterceptor(
            LoggingInterceptor(LoggingInterceptor.Level.BODY),
        )
        .build()
}

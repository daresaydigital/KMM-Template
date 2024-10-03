package co.daresay.kmmtemplate.di.modules

import org.koin.dsl.module

val appModule = module {
    single { PlatformName() }
}

fun appModule() = listOf(appModule, commonModule)

/**
 * TODO stub declaration for test correctness of Koin configuration. Remove with actual implementations
 */
expect class PlatformName() {
    val name: String
}

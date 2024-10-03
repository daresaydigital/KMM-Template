package co.daresay.kmmtemplate.di.util

import co.daresay.kmmtemplate.di.modules.appModule
import org.koin.core.context.startKoin

fun initKoin(){
    startKoin {
        modules(appModule())
    }
}

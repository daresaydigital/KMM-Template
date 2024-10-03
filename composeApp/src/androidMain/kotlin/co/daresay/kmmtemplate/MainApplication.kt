package co.daresay.kmmtemplate

import android.app.Application
import co.daresay.kmmtemplate.di.modules.androidModule
import co.daresay.kmmtemplate.di.modules.appModule
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.startKoin

class MainApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidContext(this@MainApplication)
            androidLogger()
            modules(appModule() + androidModule)
        }
    }
}

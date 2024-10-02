import org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.apollo)
}

kotlin {
    androidTarget {
        @OptIn(ExperimentalKotlinGradlePluginApi::class)
        compilerOptions {
            jvmTarget.set(JvmTarget.JVM_11)
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach { iosTarget ->
        iosTarget.binaries.framework {
            baseName = "Shared"
            isStatic = true
        }
    }
    
    sourceSets {
        androidMain.dependencies {





            //di dependencies




            //networking dependencies




            //navigation dependencies




            //view_models dependencies





        }
        commonMain.dependencies {
            implementation(libs.apollo.runtime)





            //di dependencies




            //networking dependencies




            //navigation dependencies




            //view_models dependencies





        }
        iosMain.dependencies {





            //di dependencies




            //networking dependencies




            //navigation dependencies




            //view_models dependencies





        }
    }
}

android {
    namespace = "co.daresay.kmmtemplate.shared"
    compileSdk = libs.versions.android.compileSdk.get().toInt()
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    defaultConfig {
        minSdk = libs.versions.android.minSdk.get().toInt()
    }
}

apollo {
    service("service") {
        packageName.set("co.daresay.kmmtemplate")
    }
}

import org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.sqlDelightVersion)
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
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
            implementation(libs.squareup.android.driver)




            //di dependencies




            //networking dependencies




            //navigation dependencies




            //view_models dependencies





        }
        commonMain.dependencies {
            implementation(libs.squareup.runtime)
            implementation(libs.squareup.coroutine)




            //di dependencies




            //networking dependencies




            //navigation dependencies




            //view_models dependencies





        }
        iosMain.dependencies {
            implementation(libs.squareup.native.driver)




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
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    defaultConfig {
        minSdk = libs.versions.android.minSdk.get().toInt()
    }
}

sqldelight {
    databases {
        create("AppDatabase") {
            packageName.set("co.daresay.kmmtemplate.database")
        }
    }
}

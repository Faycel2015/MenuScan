buildscript {
    ext.kotlin_version = "1.9.25"

    // Define flutter properties that plugins can access
    ext.flutter = [
        compileSdkVersion: 34,
    minSdkVersion: 21,
    targetSdkVersion: 34,
    ndkVersion: "26.1.10909125"
    ]
}

plugins {
    id("com.android.application") version "8.9.1" apply false
    id("org.jetbrains.kotlin.android") version "1.9.25" apply false
    id("com.google.gms.google-services") version "4.4.2" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
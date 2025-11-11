plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    namespace = "com.faycel.menuscan"  // <- Your new package
    compileSdk = 34  // Use your target compile SDK

    defaultConfig {
        applicationId = "com.faycel.menuscan"  // <- Your new package
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        // For Flutter v2 embedding
        multiDexEnabled = true
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("com.google.android.material:material:1.11.0")
    implementation("androidx.annotation:annotation-jvm:1.9.1")
}

// This ensures Flutter plugins work correctly
apply(plugin = "com.google.gms.google-services")

fun android(function: Any) {}

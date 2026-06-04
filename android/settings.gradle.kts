pluginManagement {
    plugins{
        id("com.android.library")
        id("org.jetbrains.kotlin.android")
    }
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }

}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()

        maven {
            url = uri("https://jitpack.io")
        }


    }
}


rootProject.name = "bazaar_updater_flutter"


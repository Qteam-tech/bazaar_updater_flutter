pluginManagement {
    plugins{
        // TODO: remove version for both plugins on production
        id("com.android.library") version "8.2.2"
        id("org.jetbrains.kotlin.android") version "1.9.22"
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


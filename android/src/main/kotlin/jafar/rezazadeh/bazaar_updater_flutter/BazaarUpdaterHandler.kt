import android.content.Context
import com.farsitel.bazaar.updater.BazaarUpdater
import com.farsitel.bazaar.updater.UpdateResult


class BazaarUpdaterHandler(private val context: Context) {

    fun getLastUpdateState(callback: (Map<String, Any?>) -> Unit) {

        BazaarUpdater.getLastUpdateState(context = context) { result ->
            when (result) {
                UpdateResult.AlreadyUpdated -> {
                    callback(
                        mapOf(
                            "state" to "alreadyUpdated",
                            "message" to "App is UpToDate!",
                        )
                    )
                }

                is UpdateResult.Error -> {
                    // Handle the error case
                    val errorMessage = result.getError()?.message
                    callback(
                        mapOf(
                            "state" to "error",
                            "message" to errorMessage
                        )
                    )

                }

                is UpdateResult.NeedUpdate -> {
                    // Handle the case where an update is needed
                    val targetVersion = result.getTargetVersionCode()
                    callback(
                        mapOf(
                            "state" to "NeedUpdate",
                            "message" to "New version is Available",
                            "targetVersion" to targetVersion
                        )
                    )
                }
            }
        }

    }

    fun updateApplication() {
        BazaarUpdater.updateApplication(context)
    }


}
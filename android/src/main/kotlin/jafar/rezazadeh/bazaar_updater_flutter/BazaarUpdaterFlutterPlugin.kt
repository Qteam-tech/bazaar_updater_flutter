package jafar.rezazadeh.bazaar_updater_flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import BazaarUpdaterHandler

/** BazaarUpdaterFlutterPlugin */
class BazaarUpdaterFlutterPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var bazaarHandler: BazaarUpdaterHandler

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bazaar_updater_flutter")
        bazaarHandler = BazaarUpdaterHandler(flutterPluginBinding.applicationContext)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {

        if (call.method == "getLastUpdateState") {

            bazaarHandler.getLastUpdateState { map ->
                result.success(map)
            }

        } else if (call.method == "updateApplication") {
            bazaarHandler.updateApplication()
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

import 'package:bazaar_updater_flutter/entities/last_update_state.dart';
import 'package:bazaar_updater_flutter/models/last_update_state_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bazaar_updater_flutter_platform_interface.dart';

/// An implementation of [BazaarUpdaterFlutterPlatform] that uses method channels.
class MethodChannelBazaarUpdaterFlutter extends BazaarUpdaterFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bazaar_updater_flutter');

  @override
  Future<LastUpdateState> getLastUpdateState() async {
    final result = await methodChannel.invokeMethod<Map<Object?, Object?>>('getLastUpdateState');

    return LastUpdateStateModel.fromMapToEntity(result);
  }

  @override
  Future<void> updateApplication() async {
    await methodChannel.invokeMapMethod("updateApplication");
  }
}

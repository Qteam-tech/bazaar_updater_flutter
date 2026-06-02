import 'package:bazaar_updater_flutter/entities/last_update_state.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bazaar_updater_flutter_method_channel.dart';

abstract class BazaarUpdaterFlutterPlatform extends PlatformInterface {
  /// Constructs a BazaarUpdaterFlutterPlatform.
  BazaarUpdaterFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BazaarUpdaterFlutterPlatform _instance = MethodChannelBazaarUpdaterFlutter();

  /// The default instance of [BazaarUpdaterFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBazaarUpdaterFlutter].
  static BazaarUpdaterFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BazaarUpdaterFlutterPlatform] when
  /// they register themselves.
  static set instance(BazaarUpdaterFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<LastUpdateState> getLastUpdateState() {
    throw UnimplementedError('getLastUpdateState() has not been implemented.');
  }

  Future<void> updateApplication();
}

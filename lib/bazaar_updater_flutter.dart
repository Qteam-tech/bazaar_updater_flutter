import 'package:bazaar_updater_flutter/entities/last_update_state.dart';

import 'data_source/bazaar_updater_flutter_platform_interface.dart';

class BazaarUpdaterFlutter {
  Future<LastUpdateState> getLastUpdateState() {
    return BazaarUpdaterFlutterPlatform.instance.getLastUpdateState();
  }

  Future<void> updateApplication() async {
    await BazaarUpdaterFlutterPlatform.instance.updateApplication();
  }
}

// TODO: add remove short-hands and sdk range defination to change log

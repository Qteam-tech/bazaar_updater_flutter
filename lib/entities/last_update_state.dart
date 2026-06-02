import 'package:bazaar_updater_flutter/enums/update_state_enum.dart';

class LastUpdateState {
  final UpdateStateEnum state;

  /// [targetVersion] is the version code of app new version
  final int? targetVersion;
  final String? message;
  LastUpdateState({required this.state, required this.message, this.targetVersion});
}

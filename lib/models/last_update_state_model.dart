import 'package:bazaar_updater_flutter/entities/last_update_state.dart';
import 'package:bazaar_updater_flutter/enums/update_state_enum.dart';

class LastUpdateStateModel extends LastUpdateState {
  LastUpdateStateModel({required super.state, required super.message});

  static LastUpdateState fromMapToEntity(Map<Object?, Object?>? mapObject) {
    if (mapObject == null) {
      return LastUpdateState(state: .error, message: "empty result!");
    }

    final map = mapObject.map((key, value) => MapEntry(key.toString(), value as dynamic));

    return LastUpdateState(
      state: UpdateStateEnum.values.firstWhere(
        (e) => e.name == map["state"],
        orElse: () => UpdateStateEnum.error,
      ),
      message: map["message"] ?? "Unknown Error occurred!",
    );
  }
}

# bazaar_updater_flutter

A Flutter plugin for checking Bazaar app updates and launching the Bazaar store page.

## Features

- Check whether a newer Bazaar app version is available.
- Open the Bazaar app store page for the current app.
- Platform support for Android.

## Installation

Add the package to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  bazaar_updater_flutter:
```

Then run:

```bash
flutter pub get
```

## Usage

Import the plugin in your Dart code:

```dart
import 'package:bazaar_updater_flutter/bazaar_updater_flutter.dart';
```

Use the plugin methods to check for updates or open the Bazaar page:

```dart
final updater = BazaarUpdaterFlutter();

final lastUpdateState = await updater.getLastUpdateState();

if (lastUpdateState.state == UpdateStateEnum.needUpdate) {
    await _bazaarUpdaterFlutterPlugin.updateApplication();
}

```

## API

- `getLastUpdateState()` - returns `LastUpdateState`.
- `updateApplication()` - opens the InApp Bazaar store page to install the new version.

## Contributing

Feel free to open issues or submit pull requests for bug fixes and improvements.

## License

This project is available under the terms of the MIT License.

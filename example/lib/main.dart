import 'package:bazaar_updater_flutter/entities/last_update_state.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:bazaar_updater_flutter/bazaar_updater_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LastUpdateState? _lastUpdateState;
  final _bazaarUpdaterFlutterPlugin = BazaarUpdaterFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    LastUpdateState lastUpdateState;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    lastUpdateState = await _bazaarUpdaterFlutterPlugin.getLastUpdateState();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _lastUpdateState = lastUpdateState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          children: [
            Center(
              child: Text(
                'Running on: ${_lastUpdateState?.state.name}\n${_lastUpdateState?.message}',
              ),
            ),
            FilledButton(
              onPressed: () async {
                await _bazaarUpdaterFlutterPlugin.updateApplication();
              },
              child: Text("updateApplication"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/services.dart';

class BluetoothController {
  static const String namespace = 'blue_printer_lucas3g';

  static const MethodChannel _channel = MethodChannel(namespace);

  final StreamController<MethodCall> _methodStreamController =
      StreamController.broadcast();

  BluetoothController._() {
    _channel.setMethodCallHandler((MethodCall call) async {
      _methodStreamController.add(call);
    });
  }

  static final BluetoothController _instance = BluetoothController._();

  static BluetoothController get instance => _instance;

  Future<void> startDiscovery() async {
    await _channel.invokeMethod('startDiscovery');
  }

  Future<List> getPairedDevices() async {
    final result = await _channel.invokeMethod('getPairedDevices');

    return result;
  }

  Future<List> getScannedDevices() async {
    final result = await _channel.invokeMethod('getScannedDevices');

    return result;
  }
}

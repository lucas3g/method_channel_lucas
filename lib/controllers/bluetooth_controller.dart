import 'dart:async';
import 'dart:convert';

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

    final jsonList = jsonDecode(result);

    return jsonList;
  }

  Future<List> getScannedDevices() async {
    final result = await _channel.invokeMethod('getScannedDevices');

    return result;
  }

  Future<bool> connectDevice(String address) async {
    final result = await _channel
        .invokeMethod('connectDevice', {'address': address}) as bool;

    print('STATUS CONEXAO: $result');

    return result;
  }

  Future<bool> printNewLine(int count) async {
    final result =
        await _channel.invokeMethod('printNewLine', {'count': count}) as bool;

    return result;
  }

  Future<bool> printCustom(String text, int size, int align) async {
    final args = {
      "text": text,
      "size": size,
      "align": align,
    };

    final result = await _channel.invokeMethod('printCustom', args) as bool;

    return result;
  }

  Future<bool> printImage(Uint8List bmp) async {
    final result =
        await _channel.invokeMethod('printImage', {'image': bmp}) as bool;

    return result;
  }

  Future<void> register() async {
    await _channel.invokeMethod('register');
  }

  Future<void> startPrint() async {
    await _channel.invokeMethod('startPrint');
  }

  Future<void> printText(String text) async {
    await _channel.invokeMethod('printText', {'text': text});
  }

  Future<void> printImageIngenico(String bmp) async {
    final bytes = await getImageFromAssets(bmp);

    await _channel.invokeMethod('printImageIngenico', {'image': bytes});
  }

  Future<void> addTextByte(String text) async {
    final bytes = stringToByte(text);

    await _channel.invokeMethod('addTextByte', {'text': bytes});
  }

  Uint8List stringToByte(String text) {
    return utf8.encode(text);
  }

  Future<Uint8List> getImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}

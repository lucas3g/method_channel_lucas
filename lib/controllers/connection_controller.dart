import 'dart:async';

import 'package:flutter/services.dart';
import 'package:method_channel_lucas/controllers/bluetooth_controller.dart';
import 'package:method_channel_lucas/controllers/connection_state.dart' as cs;
import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = ConnectionControllerBase
    with _$ConnectionController;

abstract class ConnectionControllerBase with Store {
  final BluetoothController bluetoothController = BluetoothController.instance;

  @observable
  cs.ConnectionState _state = cs.NotConnectedState();

  @computed
  cs.ConnectionState get state => _state;

  @action
  emit(cs.ConnectionState newState) {
    _state = newState;
  }

  @action
  Future connectDevice(String address) async {
    try {
      emit(cs.LoadingConnection());

      final result = await bluetoothController.connectDevice(address);

      if (result) {
        emit(cs.ConnectedState(deviceAddres: address));

        return;
      }

      emit(cs.NotConnectedState());

      return result;
    } catch (e) {
      emit(cs.NotConnectedState());
    }
  }

  @action
  Future printNewLine(int count) async {
    await bluetoothController.printNewLine(count);
  }

  @action
  Future printCustom(String text, int size, int align) async {
    await bluetoothController.printCustom(text, size, align);
  }

  @action
  Future printImage(String bmp) async {
    final bytes = await getImageFromAssets(bmp);

    await bluetoothController.printImage(bytes);
  }

  Future<Uint8List> getImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}

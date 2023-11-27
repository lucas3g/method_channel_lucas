import 'package:method_channel_lucas/controllers/bluetooth_controller.dart';
import 'package:method_channel_lucas/controllers/connection_state.dart';
import 'package:mobx/mobx.dart';

part 'connection_controller.g.dart';

class ConnectionController = ConnectionControllerBase
    with _$ConnectionController;

abstract class ConnectionControllerBase with Store {
  final BluetoothController bluetoothController = BluetoothController.instance;

  @observable
  ConnectionState _state = NotConnectedState();

  @computed
  ConnectionState get state => _state;

  @action
  emit(ConnectionState newState) {
    _state = newState;
  }

  @action
  Future connectDevice(String address) async {
    try {
      emit(LoadingConnection());

      final result = await bluetoothController.connectDevice(address);

      if (result) {
        emit(ConnectedState(deviceAddres: address));

        return;
      }

      emit(NotConnectedState());

      return result;
    } catch (e) {
      emit(NotConnectedState());
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
}

import 'package:method_channel_lucas/controllers/bluetooth_controller.dart';
import 'package:method_channel_lucas/controllers/bluetooth_state.dart';
import 'package:mobx/mobx.dart';

part 'bluetooth_store.g.dart';

class BluetoothStore = BluetoothStoreBase with _$BluetoothStore;

abstract class BluetoothStoreBase with Store {
  final BluetoothController bluetoothController = BluetoothController.instance;

  @observable
  BluetoothState _state = InitialBlueState();

  @computed
  BluetoothState get state => _state;

  @action
  emit(BluetoothState newState) {
    _state = newState;
  }

  @action
  Future getDevicesPaired() async {
    emit(state.loading());

    final paireds = await bluetoothController.getPairedDevices();

    emit(state.success(paireds));
  }

  @action
  Future startScan() async {
    await bluetoothController.startDiscovery();
  }
}

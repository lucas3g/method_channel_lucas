abstract class BluetoothState {
  final List devices;

  BluetoothState({required this.devices});

  LoadingBlueState loading() {
    return LoadingBlueState(devices: devices);
  }

  SuccessBlueState success(List? devices) {
    return SuccessBlueState(
      devices: devices ?? this.devices,
    );
  }
}

class InitialBlueState extends BluetoothState {
  InitialBlueState() : super(devices: []);
}

class LoadingBlueState extends BluetoothState {
  LoadingBlueState({required super.devices});
}

class SuccessBlueState extends BluetoothState {
  SuccessBlueState({required super.devices});
}

class ErrorBlueState extends BluetoothState {
  ErrorBlueState({required super.devices});
}

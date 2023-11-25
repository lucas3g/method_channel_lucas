// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BluetoothStore on BluetoothStoreBase, Store {
  Computed<BluetoothState>? _$stateComputed;

  @override
  BluetoothState get state =>
      (_$stateComputed ??= Computed<BluetoothState>(() => super.state,
              name: 'BluetoothStoreBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'BluetoothStoreBase._state', context: context);

  @override
  BluetoothState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(BluetoothState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$getDevicesPairedAsyncAction =
      AsyncAction('BluetoothStoreBase.getDevicesPaired', context: context);

  @override
  Future<dynamic> getDevicesPaired() {
    return _$getDevicesPairedAsyncAction.run(() => super.getDevicesPaired());
  }

  late final _$startScanAsyncAction =
      AsyncAction('BluetoothStoreBase.startScan', context: context);

  @override
  Future<dynamic> startScan() {
    return _$startScanAsyncAction.run(() => super.startScan());
  }

  late final _$BluetoothStoreBaseActionController =
      ActionController(name: 'BluetoothStoreBase', context: context);

  @override
  dynamic emit(BluetoothState newState) {
    final _$actionInfo = _$BluetoothStoreBaseActionController.startAction(
        name: 'BluetoothStoreBase.emit');
    try {
      return super.emit(newState);
    } finally {
      _$BluetoothStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}

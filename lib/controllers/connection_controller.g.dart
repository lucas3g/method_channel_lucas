// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionController on ConnectionControllerBase, Store {
  Computed<ConnectionState>? _$stateComputed;

  @override
  ConnectionState get state =>
      (_$stateComputed ??= Computed<ConnectionState>(() => super.state,
              name: 'ConnectionControllerBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'ConnectionControllerBase._state', context: context);

  @override
  ConnectionState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ConnectionState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$connectDeviceAsyncAction =
      AsyncAction('ConnectionControllerBase.connectDevice', context: context);

  @override
  Future<dynamic> connectDevice(String address) {
    return _$connectDeviceAsyncAction.run(() => super.connectDevice(address));
  }

  late final _$ConnectionControllerBaseActionController =
      ActionController(name: 'ConnectionControllerBase', context: context);

  @override
  dynamic emit(ConnectionState newState) {
    final _$actionInfo = _$ConnectionControllerBaseActionController.startAction(
        name: 'ConnectionControllerBase.emit');
    try {
      return super.emit(newState);
    } finally {
      _$ConnectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}

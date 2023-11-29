// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionController on ConnectionControllerBase, Store {
  Computed<cs.ConnectionState>? _$stateComputed;

  @override
  cs.ConnectionState get state =>
      (_$stateComputed ??= Computed<cs.ConnectionState>(() => super.state,
              name: 'ConnectionControllerBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'ConnectionControllerBase._state', context: context);

  @override
  cs.ConnectionState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(cs.ConnectionState value) {
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

  late final _$printNewLineAsyncAction =
      AsyncAction('ConnectionControllerBase.printNewLine', context: context);

  @override
  Future<dynamic> printNewLine(int count) {
    return _$printNewLineAsyncAction.run(() => super.printNewLine(count));
  }

  late final _$printCustomAsyncAction =
      AsyncAction('ConnectionControllerBase.printCustom', context: context);

  @override
  Future<dynamic> printCustom(String text, int size, int align) {
    return _$printCustomAsyncAction
        .run(() => super.printCustom(text, size, align));
  }

  late final _$printImageAsyncAction =
      AsyncAction('ConnectionControllerBase.printImage', context: context);

  @override
  Future<dynamic> printImage(String bmp) {
    return _$printImageAsyncAction.run(() => super.printImage(bmp));
  }

  late final _$ConnectionControllerBaseActionController =
      ActionController(name: 'ConnectionControllerBase', context: context);

  @override
  dynamic emit(cs.ConnectionState newState) {
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

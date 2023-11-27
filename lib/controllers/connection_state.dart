// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ConnectionState {}

class LoadingConnection extends ConnectionState {}

class ConnectedState extends ConnectionState {
  String deviceAddres;

  ConnectedState({
    required this.deviceAddres,
  });
}

class NotConnectedState extends ConnectionState {}

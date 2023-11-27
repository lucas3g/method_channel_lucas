import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:method_channel_lucas/controllers/bluetooth_state.dart';
import 'package:method_channel_lucas/controllers/bluetooth_store.dart';
import 'package:method_channel_lucas/controllers/connection_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BluetoothStore bluetoothStore = BluetoothStore();
  final ConnectionController connectionController = ConnectionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (context) {
                  final state = bluetoothStore.state;

                  if (state is InitialBlueState) {
                    return const Center(
                      child: Text('Clique em Buscar Devices'),
                    );
                  }

                  if (state is! SuccessBlueState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final devices = state.devices;

                  if (devices.isEmpty) {
                    return const Text('Nenhum dispositivo encontrado');
                  }

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dispositivos Pareados'),
                        const Divider(),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              final device = devices[index];

                              return Observer(builder: (context) {
                                final stateConn = connectionController.state;

                                return ListTile(
                                  title: Text(
                                    device['name'],
                                  ),
                                  subtitle: Text(
                                    (stateConn is ConnectionState)
                                        ? 'Impressora conectada'
                                        : device['address'],
                                  ),
                                  onTap: () async {
                                    await connectionController
                                        .connectDevice(device['address']);
                                  },
                                );
                              });
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10),
                            itemCount: devices.length,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: () async {
                    await connectionController.printCustom(
                      'Pagina de Teste',
                      1,
                      1,
                    );

                    for (var i = 0; i < 10; i++) {
                      await connectionController.printNewLine();
                    }
                  },
                  child: const Text('Imprimir Pagina de Teste'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    for (var i = 0; i < 10; i++) {
                      await connectionController.printNewLine();
                    }
                  },
                  child: const Text('Imprimir 10 Linhas'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await bluetoothStore.getDevicesPaired();
                  },
                  child: const Text('Buscar Devices'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

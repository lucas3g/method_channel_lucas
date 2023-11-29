import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:method_channel_lucas/controllers/bluetooth_controller.dart';
import 'package:method_channel_lucas/controllers/bluetooth_state.dart';
import 'package:method_channel_lucas/controllers/bluetooth_store.dart';
import 'package:method_channel_lucas/controllers/connection_controller.dart';
import 'package:method_channel_lucas/controllers/connection_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BluetoothStore bluetoothStore = BluetoothStore();
  final ConnectionController connectionController = ConnectionController();

  final BluetoothController bluetoothController = BluetoothController.instance;

  late int selectedIndex = -1;

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
                                  leading: index == selectedIndex &&
                                          stateConn is LoadingConnection
                                      ? const CircularProgressIndicator()
                                      : null,
                                  title: Text(
                                    device['name'],
                                  ),
                                  subtitle: Text(
                                    (stateConn is ConnectedState) &&
                                            device['address'] ==
                                                stateConn.deviceAddres
                                        ? 'Impressora conectada'
                                        : device['address'],
                                    style: TextStyle(
                                      color: (stateConn is ConnectedState) &&
                                              device['address'] ==
                                                  stateConn.deviceAddres
                                          ? Colors.green
                                          : Colors.black,
                                    ),
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      selectedIndex = index;
                                    });

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
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () async {
                          await connectionController
                              .printImage('assets/images/NFE.bmp');

                          await connectionController.printNewLine(10);
                        },
                        child: const Text('Imprimir Image'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () async {
                          await connectionController.printCustom(
                            'Pagina de Teste',
                            1,
                            1,
                          );

                          await connectionController.printNewLine(10);
                        },
                        child: const Text('Imprimir Pagina de Teste'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: EdgeInsets.zero),
                        onPressed: () async {
                          await connectionController.printNewLine(10);
                        },
                        child: const Text('Imprimir 10 Linhas'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: EdgeInsets.zero),
                        onPressed: () async {
                          await bluetoothStore.getDevicesPaired();
                        },
                        child: const Text('Buscar Devices'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: EdgeInsets.zero),
                        onPressed: () async {
                          await bluetoothController.register();
                        },
                        child: const Text('Registrar'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: EdgeInsets.zero),
                        onPressed: () async {
                          await bluetoothController
                              .printImageIngenico('assets/images/qr.png');
                        },
                        child: const Text('Imprimir NFCe'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            padding: EdgeInsets.zero),
                        onPressed: () async {
                          bluetoothController.addTextByte('Testeeeeee');

                          await bluetoothController.startPrint();
                        },
                        child: const Text('Imprimir Texto Byte'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

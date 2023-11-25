package com.example.method_channel_lucas

import android.bluetooth.BluetoothManager

import android.widget.Toast
import com.elsistemas.bluetoothprinterlib.data.AndroidBluetoothController
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity(): FlutterActivity() {
    private val channelName = "blue_printer_lucas3g"

    private val bluetoothManager by lazy {
        applicationContext.getSystemService(BluetoothManager::class.java)
    }
    private val bluetoothAdapter by lazy {
        bluetoothManager?.adapter
    }

    private val isBluetoothEnabled: Boolean
        get() = bluetoothAdapter?.isEnabled == true

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val androidBlue = AndroidBluetoothController(applicationContext)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        channel.setMethodCallHandler { call, result ->
            if (call.method == "showToast"){
                Toast.makeText(context, "Foooi", Toast.LENGTH_LONG).show()
            }

            if (call.method == "returnValue"){
                result.success(10)
            }

            if (call.method == "startDiscovery"){
              androidBlue.startDiscovery()
            }

            if (call.method == "getPairedDevices"){
               result.success(androidBlue.pairedDevices.value)
            }

            if (call.method == "getScannedDevices"){
                result.success(androidBlue.scannedDevices.value)
            }
        }
    }
}

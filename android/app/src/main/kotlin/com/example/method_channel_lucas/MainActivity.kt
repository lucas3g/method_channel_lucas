package com.example.method_channel_lucas

import android.bluetooth.BluetoothManager

import android.widget.Toast
import com.elsistemas.bluetoothprinterellib.BlueThermalPrinterPlugin
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

        val androidBlue = BlueThermalPrinterPlugin(applicationContext)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        channel.setMethodCallHandler { call, result ->
            if (call.method == "getPairedDevices"){
                result.success(androidBlue.pairedDevices)
            }

            if (call.method == "connectDevice"){
                var args = call.arguments as Map<String, *>;
                var address = args["address"].toString();

                result.success(androidBlue.connect(address));
            }

            if (call.method == "printNewLine"){
                var args = call.arguments as Map<String, *>;
                var count = args["count"] as Int;

                result.success(androidBlue.printNewLine(count));
            }

            if (call.method == "printCustom"){
                var args = call.arguments as Map<String, *>;
                var text = args["text"].toString();
                var size = args["size"] as Int;
                var align = args["align"] as Int;


                result.success(androidBlue.printCustom(text,size,align,null));
            }
        }
    }
}

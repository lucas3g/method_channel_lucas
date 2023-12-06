package com.example.method_channel_lucas

import android.bluetooth.BluetoothManager
import com.elsistemas.positivoprinterlib.PositivoPrinterPlugin

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

//        val androidBlue = BlueThermalPrinterPlugin(applicationContext)
//
//        val ingenicoEL = IngenicoPrinter(applicationContext);
//
        val positivoPrinter = PositivoPrinterPlugin(applicationContext);

//        val printerPlugin = PrinterPlugin(applicationContext);

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        channel.setMethodCallHandler { call, result ->
//            if (call.method == "getPairedDevices"){
//                result.success(androidBlue.pairedDevices)
//            }
//
            if (call.method == "printImagePositivo"){
                var args = call.arguments as Map<String, *>;
                var bmp = args["image"] as ByteArray;

                positivoPrinter.printImage(bmp);
                positivoPrinter.printBlankLine(5);
            }

//            if (call.method == "connectDevice"){
//                var args = call.arguments as Map<String, *>;
//                var address = args["address"].toString();
//
//                result.success(androidBlue.connect(address));
//            }
//
//            if (call.method == "printNewLine"){
//                var args = call.arguments as Map<String, *>;
//                var count = args["count"] as Int;
//
//                result.success(androidBlue.printNewLine(count));
//            }
//
//            if (call.method == "printCustom"){
//                var args = call.arguments as Map<String, *>;
//                var text = args["text"].toString();
//                var size = args["size"] as Int;
//                var align = args["align"] as Int;
//
//
//                result.success(androidBlue.printCustom(text,size,align,null));
//            }
//
//
//            if (call.method == "printImage"){
//                var args = call.arguments as Map<String, *>;
//                var bmp = args["image"] as ByteArray;
//
//                result.success(androidBlue.printImageBytes(bmp));
//            }
//
//            if (call.method == "register"){
//                ingenicoEL.register();
//            }
//
//
//            if (call.method == "printText"){
//                var args = call.arguments as Map<String, *>;
//                var text = args["text"] as String;
//
//                ingenicoEL.addText(text);
//            }
//
//            if (call.method == "addTextByte"){
//                var args = call.arguments as Map<String, *>;
//                var text = args["text"] as ByteArray;
//
//                ingenicoEL.addTextByte(text);
//            }
//
//            if (call.method == "startPrint"){
//                ingenicoEL.startPrint();
//            }

//            if (call.method == "printTextPlugin"){
//                var args = call.arguments as Map<String, *>;
//                var text = args["text"] as String;
//
//                printerPlugin.printText(text);
//            }
        }
    }
}

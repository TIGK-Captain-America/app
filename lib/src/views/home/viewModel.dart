import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:mower/src/views/scanBluetooth/scanBluetooth.dart';

class HomeViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();
  final BluetoothService _bluetoothService = GetIt.I.get<BluetoothService>();

  void init() async {
    bool a = await _bluetoothService.isConnected();

    var devices = await _bluetoothService.devices();
    print("devices ${devices}");

    print("status => $a");
    List<Blue.BluetoothService> services =
        await _deviceService.discoverServices();

    services.forEach((service) async {
      print("services => ${service} ${service.characteristics}");
      if (service.uuid == Blue.Guid("0000ffe1-0000-1000-8000-00805f9b34fb")) {
        service.characteristics.forEach((c) async {
          if (c.uuid == Blue.Guid('0000ffe3-0000-1000-8000-00805f9b34fb')) {
            _deviceService.setCharacteristic = c;
          }
        });
      }
    });
  }

  Future disconnectDevice() async {
    try {
      await _deviceService.disconnect();
      Get.offAll(ScanBluetoothView());
    } catch (e) {
      print("disconnect error $e");
    }
  }
}

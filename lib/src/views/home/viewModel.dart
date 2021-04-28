import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/views/scanBluetooth/scanBluetooth.dart';

class HomeViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();

  void init() async {
    List<BluetoothService> services = await _deviceService.discoverServices();

    services.forEach((service) async {
      if (service.uuid == Guid("0000ffe1-0000-1000-8000-00805f9b34fb")) {
        service.characteristics.forEach((c) async {
          if (c.uuid == Guid('0000ffe3-0000-1000-8000-00805f9b34fb')) {
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

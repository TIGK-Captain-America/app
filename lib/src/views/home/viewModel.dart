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

    services.forEach((service) {
      print("services ${service}");
    });

    var characteristics = services[0].characteristics;
    for (BluetoothCharacteristic c in characteristics) {
      print(c.uuid);
      List<int> value = await c.read();
      print("value $value");
    }
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

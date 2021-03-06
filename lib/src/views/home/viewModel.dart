import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/utils/Ids.dart';
import 'package:mower/src/views/error/error.dart';
import 'package:mower/src/views/landing/landing.dart';
import 'package:mower/src/views/scanBluetooth/scanBluetooth.dart';

class HomeViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();
  
  /// Search for the characteristics and set the right too use.
  void init() async {
    List<Blue.BluetoothService> services =
        await _deviceService.discoverServices();

    services.forEach((service) async {
      if (service.uuid == Blue.Guid(Ids.robotService)) {
        service.characteristics.forEach((c) async {
          if (c.uuid == Blue.Guid(Ids.robotCharacteristic)) {
            _deviceService.setCharacteristic = c;
          }
          if (c.uuid == Blue.Guid(Ids.notifyCharacteristic)) {
            await c.setNotifyValue(true);
            _deviceService.setNotifyCharacteristic = c;
          }
        });
      }
    });

    if (_deviceService.characteristic == null) {
      Function function = () async {
        await _deviceService.disconnect();
        Get.offAll(() => LandingView());
      };
      Get.offAll(() => ErrorView(
          text: "You are connected to the wrong device",
          showbutton: true,
          function: function));
    }
  }

  Future disconnectDevice() async {
    try {
      await _deviceService.disconnect();
      Get.offAll(() => ScanBluetoothView());
    } catch (e) {
      Get.offAll(() => ErrorView(
            showbutton: false,
            text: "Error $e",
          ));
    }
  }
}

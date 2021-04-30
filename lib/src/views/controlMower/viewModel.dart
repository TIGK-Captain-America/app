import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/deviceService.dart';

class ControlMowerViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();

  Future<void> control(List<int> com) async {
    try {
      await _deviceService.characteristic.write(com);
    } catch (e) {
      print("Error: $e");
    }
  }
}

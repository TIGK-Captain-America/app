import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/views/error/error.dart';

/// Connects to high level requirements #A1.2
/// And the low level requirements:
/// - Handle user input
/// - Send driver commands with Bluetooth

/// Connects to high level requirements #A1.3
/// And the low level requirements:
/// - Get sensor data from Robot

class ControlMowerViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();

  int _collisionValue = 100;

  int get collisionValue => _collisionValue;

  void init() {
    _deviceService.notify.value.listen((event) {
      if (event.isNotEmpty) {
        String result = utf8.decode(event);
        int dist = int.parse(result);
        _collisionValue = dist;
        notifyListeners();
      }
    });
  }

  Future<void> control(List<int> com) async {
    try {
      await _deviceService.characteristic.write(com);
    } catch (e) {
      Get.offAll(() => ErrorView(
            showbutton: false,
            text: "Error $e",
          ));
    }
  }
}

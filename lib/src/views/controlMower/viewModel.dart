import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/views/error/error.dart';

  /// Connects to high level requirements #A1.2
  /// And the low level requirements:
  /// - Handle user input
  /// - Send driver commands with Bluetooth
class ControlMowerViewModel extends ChangeNotifier {
  final DeviceService _deviceService = GetIt.I.get<DeviceService>();

  Future<void> control(List<int> com) async {
    try {
      await _deviceService.characteristic.write(com);
    } catch (e) {
      Get.offAll(() => ErrorView(showbutton: false, text: "Error $e",));
    }
  }
}

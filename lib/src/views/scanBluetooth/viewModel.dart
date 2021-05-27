import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get/get.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/views/error/error.dart';
import 'package:mower/src/views/landing/landing.dart';

class ScanBluetoothViewModel extends ChangeNotifier {
  final BluetoothService _service = GetIt.I.get<BluetoothService>();

  void init() {}

  Stream<List<Blue.ScanResult>> get stream => _service.results;

  void startScan() async {
    try {
      if (await _service.state.first == Blue.BluetoothState.on &&
          !(await _service.canStart())) {
        await _service.scan(timeout: Duration(seconds: 10));
      } else {
        Get.offAll(() => LandingView());
      }
    } catch (e) {
      Get.offAll(() => ErrorView(showbutton: false, text: "Error $e",));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:mower/src/services/bluetoothService.dart';
import 'package:get_it/get_it.dart';

class ScanBluetoothViewModel extends ChangeNotifier {
  final BluetoothService _service = GetIt.I.get<BluetoothService>();

  void init() {}

  Stream<List<Blue.ScanResult>> get stream => _service.results;

  void startScan() async {
    try {
      if (await _service.canStart()) {
        await _service.scan(timeout: Duration(seconds: 12));
      } else {
        // add a check to see the error
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

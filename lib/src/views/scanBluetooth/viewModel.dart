import 'package:flutter/material.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:get_it/get_it.dart';

class ScanBluetoothViewModel extends ChangeNotifier {
  final BluetoothService _service = GetIt.I.get<BluetoothService>();

  void init() {
  }

  Future<void> startScan() async {
    if (await _service.canStart()) {
      print(await _service.scan(timeout: Duration(seconds: 12)));
    } else {
      throw Error();
      // add a check to see the error
    }
  }
}

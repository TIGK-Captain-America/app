import 'package:flutter_blue/flutter_blue.dart';

class BluetoothService {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;

  dynamic scan({Duration timeout, ScanMode scanMode = ScanMode.lowLatency}) {
    return _flutterBlue.startScan(
        scanMode: scanMode, timeout: timeout, allowDuplicates: false);
  }

  dynamic stop() {
    return _flutterBlue.stopScan();
  }

  Stream<List<ScanResult>> get results =>
      _flutterBlue.scanResults.asBroadcastStream();

  Stream<BluetoothState> get state => _flutterBlue.state;

  Future<bool> canStart() {
    return _flutterBlue.isScanning.first;

  }

  Future<bool> isConnected() async {
    var devices = await _flutterBlue.connectedDevices;

    return devices.isNotEmpty;
  }

  Future<List<BluetoothDevice>> devices() {
    return _flutterBlue.connectedDevices;
  }

  Stream<bool> get isScanning => _flutterBlue.isScanning;
}

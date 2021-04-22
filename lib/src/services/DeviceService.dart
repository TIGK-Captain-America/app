import 'package:flutter_blue/flutter_blue.dart';

class DeviceService {
  BluetoothDevice _device;

  set device(BluetoothDevice newDevice) {
    _device = newDevice;
  }

  Future disconnect() {
    return _device.disconnect();
  }

  Future<List<BluetoothService>> discoverServices() {
    return _device.discoverServices();
  }

  Stream<List<BluetoothService>> get streamServices => _device.services;

  Stream<BluetoothDeviceState> get deviceState => _device.state;
}

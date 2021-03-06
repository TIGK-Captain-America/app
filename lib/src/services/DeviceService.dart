import 'package:flutter_blue/flutter_blue.dart';

  /// Connects to high level requirements #A1.2
  /// And the low level requirements:
  /// - Handle user input
  /// - Send driver commands with Bluetooth
class DeviceService {
  BluetoothDevice _device;
  BluetoothCharacteristic _sendCharacteristic;
  BluetoothCharacteristic _notifyCharacteristic;

  set device(BluetoothDevice newDevice) {
    _device = newDevice;
  }

  set setCharacteristic(BluetoothCharacteristic c) {
    _sendCharacteristic = c;
  }

  set setNotifyCharacteristic(BluetoothCharacteristic c) {
    _notifyCharacteristic = c;
  }

  BluetoothCharacteristic get characteristic => _sendCharacteristic;

  BluetoothCharacteristic get notify => _notifyCharacteristic;

  Future disconnect() {
    return _device.disconnect();
  }

  Future<List<BluetoothService>> discoverServices() {
    return _device.discoverServices();
  }

  Stream<List<BluetoothService>> get streamServices => _device.services;

  Stream<BluetoothDeviceState> get deviceState => _device.state;
}

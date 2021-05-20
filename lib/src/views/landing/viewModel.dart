import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:mower/src/utils/customStreamError.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;

class LandingViewModel extends ChangeNotifier {
  final BluetoothService _service = GetIt.I.get<BluetoothService>();
  StreamSubscription _subscription;

  StreamController<bool> _streamController;
  Timer _timer;
  Blue.BluetoothState _bluetoothState = Blue.BluetoothState.unknown;
  bool hasShownRequest = false;

  void init() {
    _streamController = new StreamController.broadcast();
    _subscription = _service.state.listen((data) {
      _bluetoothState = data;
    });
    _streamController?.add(false);
    _timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) async {
      if (_bluetoothState == Blue.BluetoothState.on) {

        /*if (await Permission.location.isDenied && !hasShownRequest) {
          hasShownRequest = true;
          await Permission.location.request();
        }*/

        if (await Permission.locationWhenInUse.isDenied && !hasShownRequest) {
          hasShownRequest = true;
          await Permission.locationWhenInUse.request();
        }

        /*
        if (await Permission.locationAlways.isDenied && !hasShownRequest) {
          hasShownRequest = true;
          await Permission.locationAlways.request();
        }*/

        if (await Permission.locationWhenInUse.isGranted ||
            await Permission.location.isGranted ||
            await Permission.locationAlways.isGranted) {
          if (await Permission.locationWhenInUse.serviceStatus ==
                  ServiceStatus.enabled ||
              await Permission.location.serviceStatus ==
                  ServiceStatus.enabled ||
              await Permission.locationAlways.serviceStatus ==
                  ServiceStatus.enabled) {
            _streamController?.add(true);
          } else {
            _streamController?.addError(
                new CustomStreamError(type: "GPS", error: "GPS is not on"));
          }
        } else {
          _streamController?.addError(
              new CustomStreamError(type: "GPS", error: "GPS is not on"));
        }
      } else {
        _streamController?.addError(
            new CustomStreamError(type: "Blue", error: "Bluetooth is not on"));
      }
    });
  }

  StreamController get streamController => _streamController;

  void close() {
    _timer?.cancel();
    _streamController?.close();
    _subscription?.cancel();
  }
}

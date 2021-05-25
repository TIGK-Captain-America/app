import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:mower/src/views/bottomNavBar/bottomNavBar.dart';

class BluetoothDeviceTile extends StatelessWidget {
  final Blue.BluetoothDevice device;

  const BluetoothDeviceTile({Key key, @required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: () async {
          try {
            if (await this.device.state.first ==
                Blue.BluetoothDeviceState.connected) {
              GetIt.I.get<DeviceService>().device = this.device;
              await GetIt.I.get<BluetoothService>().stop();
              Get.offAll(() => BottomNavBar());
            } else {
              await this.device.connect(autoConnect: false);
              GetIt.I.get<DeviceService>().device = this.device;
              await GetIt.I.get<BluetoothService>().stop();
              Get.offAll(() => BottomNavBar());
            }
          } catch (e) {
            print("Error $e");
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 5, bottom: 20, top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Row(
            children: [
              Icon(Icons.bluetooth_searching, color: Colors.black, size: 30),
              Spacer(),
              Text((this.device.name == ""
                  ? this.device.id.toString()
                  : this.device.name)),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

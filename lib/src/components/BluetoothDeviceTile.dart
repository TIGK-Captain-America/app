import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mower/src/views/home/home.dart';

class BluetoothDeviceTile extends StatelessWidget {
  final String title;

  const BluetoothDeviceTile({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5, 
        bottom: 5
      ),
      child: GestureDetector(
        onTap: () => {
          print('tapped ${this.title}'),
          Get.to(() => HomeView())
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 5,
            bottom: 20,
            top: 20
          ),
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
              Text(this.title),
              Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
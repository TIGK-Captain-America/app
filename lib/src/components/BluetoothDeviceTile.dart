import 'dart:math';

import 'package:flutter/material.dart';

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
          print('tapped ${this.title}')
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 50,
            right: 5,
            bottom: 22.5,
            top: 22.5
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Text(this.title),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/views/landing/landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(BluetoothService());
  GetIt.I.registerSingleton(DeviceService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LandingView(),
    );
  }
}
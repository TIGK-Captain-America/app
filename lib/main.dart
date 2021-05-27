import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mower/src/services/DeviceService.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:get_it/get_it.dart';
import 'package:mower/src/views/landing/landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        primarySwatch: Colors.blue,
      ),
      home: LandingView(),
    );
  }
}

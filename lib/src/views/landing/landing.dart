import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get_it/get_it.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:mower/src/views/error/error.dart';
import 'package:mower/src/views/landing/viewModel.dart';
import 'package:mower/src/views/scanBluetooth/scanBluetooth.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  LandingView({Key key}) : super(key: key);

  final BluetoothService _service = GetIt.I.get<BluetoothService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      //onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 105, 1),
        body: SafeArea(
          child: StreamBuilder<Blue.BluetoothState>(
              stream: _service.state,
              initialData: Blue.BluetoothState.unknown,
              builder: (context, snapshot) {
                if (snapshot.data == Blue.BluetoothState.on) {
                  return ScanBluetoothView();
                }
                return ErrorView(
                  text: "Bluetooth is not enabled",
                  showbutton: false,
                );
              }),
        ),
      ),
    );
  }
}

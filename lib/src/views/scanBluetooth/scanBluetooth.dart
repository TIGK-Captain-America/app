import 'package:flutter/material.dart';
import 'package:mower/src/views/scanBluetooth/viewModel.dart';
import 'package:stacked/stacked.dart';

class ScanBluetoothView extends StatelessWidget {
  const ScanBluetoothView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanBluetoothViewModel>.reactive(
      viewModelBuilder: () => ScanBluetoothViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.updateTitle();
          },
        ),
        body: Center(
          child: Text(viewModel.title),
        ),
      ),
    );
  }
}
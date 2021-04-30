import 'package:flutter/material.dart';
import 'package:mower/src/utils/customStreamError.dart';
import 'package:mower/src/views/error/error.dart';
import 'package:mower/src/views/landing/viewModel.dart';
import 'package:mower/src/views/scanBluetooth/scanBluetooth.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  LandingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 105, 1),
        body: SafeArea(
          child: StreamBuilder<bool>(
              stream: viewModel.streamController.stream,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  viewModel.close();
                  return ScanBluetoothView();
                }
                if (snapshot.hasError) {
                  CustomStreamError _error = snapshot.error;
                  return ErrorView(
                    text: _error.error,
                    showbutton: false,
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}

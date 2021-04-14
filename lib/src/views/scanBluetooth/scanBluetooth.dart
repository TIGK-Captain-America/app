import 'package:flutter/material.dart';
import 'package:mower/src/components/BluetoothDeviceTile.dart';
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
        backgroundColor: Color.fromRGBO(255, 159, 105, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Scan & Connect',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    top: 20,
                  ),
                  child: Container(
                    height: (MediaQuery.of(context).size.height / 1.33),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return BluetoothDeviceTile(title: 'Entry $index');
                      }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Start scan',
                      style: TextStyle(color: Colors.black),
                    )
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

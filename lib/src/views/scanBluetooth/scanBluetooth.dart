import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:get_it/get_it.dart';
import 'package:mower/src/components/BluetoothDeviceTile.dart';
import 'package:mower/src/services/bluetoothService.dart';
import 'package:mower/src/views/scanBluetooth/viewModel.dart';
import 'package:stacked/stacked.dart';

class ScanBluetoothView extends StatelessWidget {
  const ScanBluetoothView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanBluetoothViewModel>.reactive(
      viewModelBuilder: () => ScanBluetoothViewModel(),
      onModelReady: (viewModel) => viewModel.init(),
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
                    child: StreamBuilder<List<Blue.ScanResult>>(
                        stream: GetIt.I.get<BluetoothService>().results,
                        initialData: [],
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Blue.ScanResult>> snapshot) {
                          if (snapshot.hasError) {
                            print("error");
                            print(snapshot.error);
                          } else {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                print("none");
                                return Text("aaaa");
                                break;
                              case ConnectionState.waiting:
                                return CircularProgressIndicator();
                                break;
                              case ConnectionState.active:
                              case ConnectionState.done:
                                print("hello");
                                print(snapshot.data);
                                return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return BluetoothDeviceTile(
                                          title:
                                              '${snapshot.data[index].device.id} ${snapshot.data[index].device.name}');
                                    });
                                break;
                            }
                          }

                          return Center(
                            child: Text("start scan"),
                          );
                        })),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      print("nu kör vi");
                      viewModel.startScan();
                    },
                    child: Text(
                      'Start scan',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mower/src/views/controlMower/viewModel.dart';
import 'package:stacked/stacked.dart';

//add functions for onpress buttons later.
class ControlMowerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ControlMowerViewModel>.reactive(
      viewModelBuilder: () => ControlMowerViewModel(),
      //onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 105, 1),
        body: SafeArea(
            child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            'Control Mower',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: GestureDetector(
                    onLongPressEnd: (LongPressEndDetails d) async {
                      print("aaaa stop");
                      await viewModel.control([48]);
                    },
                    onLongPress: () async {
                      print("aaaa up");
                      await viewModel.control([49]);
                    },
                    child: Icon(Icons.arrow_upward, color: Colors.black, size: 40,),
                  ))
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: GestureDetector(
                onLongPressEnd: (LongPressEndDetails d) async {
                  print("aaaa stop");
                  await viewModel.control([48]);
                },
                onLongPress: () async {
                  print("aaaa left");
                  await viewModel.control([51]);
                },
                child: Icon(Icons.arrow_back, color: Colors.black, size: 40,),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: GestureDetector(
                onLongPressEnd: (LongPressEndDetails d) async {
                  print("aaaa stop");
                  await viewModel.control([48]);
                },
              onLongPress: () async {
                  print("aaaa right");
                  await viewModel.control([50]);
                },
                child: Icon(Icons.arrow_forward, color: Colors.black, size: 40,),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: GestureDetector(
                  onLongPressEnd: (LongPressEndDetails d) async {
                    print("aaaa stop");
                    await viewModel.control([48]);
                  },
                  onLongPress: () async {
                    print("aaaa down");
                    await viewModel.control([52]);
                  },
                  child: Icon(
                    Icons.arrow_downward, color: Colors.black, size: 40,),
                  ),
                ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(100.0),
                child: ElevatedButton(
                  child: Text("Pause"),
                  onPressed: () {},
                ),
              )
            ],
          )
        ])),
      ),
    );
  }
}

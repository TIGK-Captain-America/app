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
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Text(
                'Control Mower',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_upward, color: Colors.black),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_downward, color: Colors.black),
                    onPressed: () {},
                  ),
                )
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
            ])
        ),
      ),
    );
  }
}

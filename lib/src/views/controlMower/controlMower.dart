import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//add functions for onpress buttons later.
class ControlMowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#FF9F69"),
        appBar: AppBar(
          title: Text("Control Mower"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ]));
  }
}

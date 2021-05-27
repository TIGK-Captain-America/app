import 'package:flutter/material.dart';
import 'package:mower/src/utils/CustomPainter.dart';
import 'package:mower/src/views/mowerView/viewModel.dart';
import 'package:stacked/stacked.dart';

class MowerView extends StatelessWidget {
  const MowerView({Key key}) : super(key: key);

  Widget showPath(MowerViewModel vm) {
    if (vm.isFinished) {
      return Expanded(
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        width: double.infinity,
        child: CustomPaint(
          painter: MowerPainter()..nodes = vm.nodes,
        ),
      ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MowerViewModel>.reactive(
      viewModelBuilder: () => MowerViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 105, 1),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'View Path',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            showPath(viewModel)
          ],
        )),
      ),
    );
  }
}

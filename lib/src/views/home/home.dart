import 'package:flutter/material.dart';
import 'package:mower/src/views/home/viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
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
                  'Home',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Icon(Icons.agriculture, size: (MediaQuery.of(context).size.width / 1.5)),
              Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                  onPressed: () => {
                    print('Disconnect')
                  },
                  child: Text(
                    'Disconnect',
                    style: TextStyle(color: Colors.black),
                  )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

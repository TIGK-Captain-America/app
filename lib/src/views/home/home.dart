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
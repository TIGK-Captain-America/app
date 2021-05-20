import 'package:flutter/material.dart';
import 'package:mower/src/models/customNode.dart';
import 'package:mower/src/services/pathService.dart';

class MowerViewModel extends ChangeNotifier {
  String title = 'default';
  var pathService = new PathService();
  List<CustomNode> nodes;
  bool isFinished = false;

  void initialise() async {
    try {
      nodes = await pathService.getPath();

      isFinished = true;
      notifyListeners();
    } catch (e) {
      //notifyListeners();
    }
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mower/src/models/customNode.dart';

class PathService {
  final String _url =
      "https://us-central1-tigk-captain-america.cloudfunctions.net/Nodes";

  Future<List<CustomNode>> getPath() async {
    var url = Uri.parse(_url);
    var response = await http.get(url);
    List<dynamic> body = jsonDecode(response.body);

    List<CustomNode> pathList = [];

    body[1]["Nodes"].forEach((element) {
      pathList.add(new CustomNode(
          collison: element["collision"],
          x: element["positions"]["x"] + .0,
          y: element["positions"]["y"] + .0));
    });

    return pathList;
  }
}

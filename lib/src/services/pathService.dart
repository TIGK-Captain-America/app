import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mower/src/models/customNode.dart';

/// Connects to high level requirements #A1.3
/// And the low level requirements:
/// - Get coordinates & sensor data from API
class PathService {
  final String _url =
      "https://us-central1-tigk-captain-america.cloudfunctions.net/Nodes";

  Future<List<CustomNode>> getPath() async {
    var url = Uri.parse(_url);
    var response = await http.get(url);
    //var res ='["lvdDg55Q3FIhKzwIVowM",{"createdAt":{"_seconds":1621587922,"_nanoseconds":497999000},"Nodes":[{"collision":false,"positions":{"w":0,"sensorDistance":0,"x":0,"distance":0,"y":0}},{"positions":{"w":182,"sensorDistance":30,"distance":0,"y":0,"x":0},"collision":false},{"positions":{"distance":6,"w":242,"x":6,"sensorDistance":7,"y":3},"collision":true},{"collision":false,"positions":{"sensorDistance":39,"x":-20,"w":194,"y":9,"distance":-20}},{"collision":false,"positions":{"sensorDistance":39,"x":-28,"w":194,"y":14,"distance":-20}},{"collision":false,"positions":{"sensorDistance":39,"x":-29,"w":194,"y":3,"distance":-20}}]}]';
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

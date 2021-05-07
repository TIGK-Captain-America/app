import 'package:flutter/material.dart';
import 'package:mower/src/models/customNode.dart';

class MowerPainter extends CustomPainter {
  List<CustomNode> _nodes;

  set nodes(List<CustomNode> newNodes) {
    _nodes = newNodes;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Paint collisionPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    Path path = Path();

    print("size ${size.width / 2} ${size.height / 2}");

    var minY = _nodes[0].y;
    var minX = _nodes[0].x;
    var maxX = _nodes[0].x;
    var maxY = _nodes[0].y;

    _nodes.forEach((element) {
      if (element.x > maxX) {
        maxX = element.x;
      }
      if (element.y > maxY) {
        maxY = element.y;
      }
      if (element.x < minX) {
        minX = element.x;
      }
      if (element.y < minY) {
        minY = element.y;
      }
    });

    print("min: $minX $minY max: $maxX $maxY");

    var startX = size.width / 2;
    var startY = size.height / 2;

    _nodes.forEach((element) {
      if (element.x == 0 && element.y == 0) {
        path.moveTo(startX, startY);
      } else {
        startX = (startX + element.x);
        startY = (startY + element.y);
        path.lineTo(startX, startY);
        path.moveTo(startX, startY);
        if (element.collison) {
          canvas.drawCircle(Offset(startX, startY), 5, collisionPaint);
        }
        canvas.drawPath(path, paint);
      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

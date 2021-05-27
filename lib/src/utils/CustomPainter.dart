import 'package:flutter/material.dart';
import 'package:mower/src/models/customNode.dart';

/// Display the path of the robot with the [CustomNode] and canvas painter

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

    Paint startPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    Path path = Path();

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

    double xMultiplier = 1;
    double yMultiplier = 1;

    var startX = size.width / 2;
    var startY = size.height / 2;

    if ((minX).abs() > (maxX).abs()) {
      xMultiplier = startX / (minX).abs();
    } else {
      xMultiplier = startX / (maxX).abs();
    }

    if ((minY).abs() > (maxY).abs()) {
      yMultiplier = startY / (minY).abs();
    } else {
      yMultiplier = startY / (maxY).abs();
    }

    var multiplier = xMultiplier < yMultiplier ? xMultiplier : yMultiplier;
    multiplier = multiplier * 0.7;

    canvas.drawCircle(Offset(startX, startY), 5, startPaint);

    _nodes.forEach((element) {
      if (element.x == 0 && element.y == 0) {
        path.moveTo(startX, startY);
      } else {

        var currentX = startX + (element.x * multiplier);
        var currentY = startY + (element.y * multiplier);

        path.lineTo(currentX, currentY);
        path.moveTo(currentX, currentY);
        if (element.collison) {
          canvas.drawCircle(Offset(currentX, currentY), 5, collisionPaint);
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

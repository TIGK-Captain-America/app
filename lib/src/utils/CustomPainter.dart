import 'package:flutter/material.dart';

class MowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(10, 200), Offset(50, 150), Paint()..strokeWidth = 4);
    canvas.drawLine(
        Offset(50, 150), Offset(300, 250), Paint()..strokeWidth = 4);
    canvas.drawLine(
        Offset(300, 250), Offset(40, 550), Paint()..strokeWidth = 4);
    canvas.drawLine(
        Offset(40, 550), Offset(200, 250), Paint()..strokeWidth = 4);
    canvas.drawLine(
        Offset(200, 250), Offset(300, 650), Paint()..strokeWidth = 4);

    canvas.drawCircle(Offset(300, 650), 10, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

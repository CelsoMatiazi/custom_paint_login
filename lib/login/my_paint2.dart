import 'package:flutter/material.dart';

class MyPainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,0);
    path0.quadraticBezierTo(size.width*0.8721429,size.height*0.0871429,size.width*0.6500000,size.height*0.0257143);
    path0.cubicTo(size.width*0.4278571,size.height*-0.0264286,size.width*0.3696429,size.height*0.1007143,size.width*0.1957143,size.height*0.0885714);
    path0.quadraticBezierTo(size.width*0.0875000,size.height*0.0846429,size.width*0.0014286,0);
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
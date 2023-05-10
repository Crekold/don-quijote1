import 'package:flutter/material.dart';

import 'PuntosLugar.dart';

class Punto extends CustomPainter {
  List<PuntoLugar> vPuntos;

  Punto(this.vPuntos);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    for (var element in vPuntos) {
      paint.color = element.color;

      // Dibuja el redondo con los atributos del vNodo
      canvas.drawCircle(
          Offset(
            element.x,
            element.y,
          ),
          element.radio,
          paint);
      _msg(element.x - 8, element.y - 13, element.mensaje, canvas);
    }
  }

  _msg(double x, double y, String msg, Canvas canvas) {
    TextSpan span = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      text: msg,
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Ajustar la posición para centrar el texto
    tp.layout();
    double dx = x - (tp.width / 2) + 7;
    double dy = y - (tp.height / 2) + 10;

    tp.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

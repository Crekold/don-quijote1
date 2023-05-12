import 'package:flutter/material.dart';

import 'PuntosLugar.dart';

import 'modelos.dart';

class Rectangulo extends CustomPainter {
  List<Cuadpal> vPal = [];

  Rectangulo(this.vPal);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.0)
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      color: Color.fromARGB(255, 6, 147, 241),
      fontSize: 20,
    );

    vPal.forEach((element) {
      final textSpan = TextSpan(
        text: element.msg,
        style: textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final rect = Rect.fromCenter(
        center: Offset(element.x, element.y - 105),
        width: textPainter.width + 5,
        height: 30,
      );
      element.w = textPainter.width + 5;

      canvas.drawRect(rect, paint);
      final textOffset = Offset(
        element.x - textPainter.width / 2,
        element.y - 110 + (13 - textPainter.height) / 2,
      );
      textPainter.paint(canvas, textOffset);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Cambia a true si el cuadrado debe repintarse dinámicamente
  }
}

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

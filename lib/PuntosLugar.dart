import 'package:flutter/material.dart';

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

class PuntoLugar {
  // _Para que sea privado
  double _x, _y, _radio;
  String _mensaje;
  Color _color;

  PuntoLugar(this._x, this._y, this._radio, this._mensaje, this._color);

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  String get mensaje => _mensaje;

  set mensaje(String value) {
    _mensaje = value;
  }

  get radio => _radio;

  set radio(value) {
    _radio = value;
  }

  get y => _y;

  set y(value) {
    _y = value;
  }

  double get x => _x;

  set x(double value) {
    _x = value;
  }
}

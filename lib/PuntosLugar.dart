import 'package:flutter/material.dart';

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

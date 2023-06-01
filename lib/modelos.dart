class Cuadpal {
  double _x, _y, _w;
  String _msg;

  Cuadpal(this._x, this._y, this._msg, this._w);

  get msg => this._msg;

  set msg(value) => this._msg = value;
  get x => this._x;

  set x(value) => this._x = value;

  get y => this._y;

  set y(value) => this._y = value;
  get w => this._w;

  set w(value) => this._w = value;
}

// items
// Guantes - Coselete - Morrion
class Item {
  double precio;
  String nombre;
  String descripcion;

  Item(this.precio, this.nombre, this.descripcion);
}

class Tienda_Items {
  List<Item> items;

  Tienda_Items(this.items);
}

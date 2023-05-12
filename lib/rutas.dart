import 'package:don_quijote/puntos/nivel2.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'paginas/tienda.dart';
import 'puntos/punto1.dart';
import 'login.dart';

class Rutas extends StatefulWidget {
  const Rutas({Key? key}) : super(key: key);

  @override
  State<Rutas> createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // on genered rute
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/Home':
            return MaterialPageRoute(builder: (context) => Home());
          case '/Tienda':
            return MaterialPageRoute(builder: (context) => Tienda());
          case '/Punto1':
            return MaterialPageRoute(builder: (context) => Punto1());
          case '/Punto2':
            return MaterialPageRoute(builder: (context) => Nivel2());
          case '/Cuatro':
          //return MaterialPageRoute(builder: (context) => Cuatro());
          case '/Cinco':
          //return MaterialPageRoute(builder: (context) => Cinco());
        }
      },
    );
  }
}

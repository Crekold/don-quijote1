import 'dart:math';

import 'package:flutter/material.dart';

import 'PuntosLugar.dart';
import 'formas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PuntoLugar> vPuntosL = [
    PuntoLugar(200, 600, 15, "1", Colors.yellowAccent),
    PuntoLugar(300, 500, 15, "2", Colors.yellowAccent),
    PuntoLugar(150, 400, 15, "3", Colors.yellowAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Don Quijote",
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/map0.png"), fit: BoxFit.fill),
        ),
        child: Scaffold(
          // Transparente para que se vea la imagen de fondo
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            title: Text(
              'Don Quijote \nde la Mancha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Courier new', // Define la fuente del texto
                fontWeight: FontWeight.bold, // Define el peso de la fuente
              ),
            ),
            backgroundColor: Colors.black.withOpacity(0),
            centerTitle: true,
            elevation: 0,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
            // Nuevo estilo del AppBar
            // Puede ser un estilo definido anteriormente
            // o un nuevo objeto AppBarTheme
            // como en el ejemplo anterior
            // appBarTheme: appBarTheme,
            // O solo el TextStyle
          ),
          // Cajon activa automaticante el menu lateral
          drawer: Drawer(
              elevation: 20,
              backgroundColor: Colors.black45,
              child: ListView(
                children: [
                  const UserAccountsDrawerHeader(
                    accountName: Text("UCB"),
                    accountEmail: Text("Don Quijote de la Mancha"),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/DonQuijote.png"),
                            fit: BoxFit.fitWidth)),
                  ),
                  Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Colors.deepOrangeAccent,
                          Colors.orange,
                          Colors.yellow
                        ]),
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: ListTile(
                      title: const Text(
                        "Tienda",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/Tienda");
                      },
                    ),
                  ),
                ],
              )),
          body: Stack(
            children: [
              CustomPaint(
                painter: Punto(vPuntosL),
              ),
              GestureDetector(
                onPanDown: (des) {
                  print(
                      "x =${des.globalPosition.dx} y =${des.globalPosition.dy}");
                  int pos = sobreNodo(des.globalPosition.dx,
                      des.globalPosition.dy - 100); //-100 por el AppBar
                  print("Pos: ${pos}");
                  if (pos >= 0) {
                    if (vPuntosL[pos - 1].mensaje == "1") {
                      print("Entra Punto 1");
                      Navigator.pushNamed(context, "/Punto1");
                    } else if (vPuntosL[pos - 1].mensaje == "2") {
                      print("Entra Punto 2");
                      Navigator.pushNamed(context, "/Punto2");
                    } else if (vPuntosL[pos - 1].mensaje == "3") {
                      print("Entra Punto 3");
                      Navigator.pushNamed(context, "/Punto3");
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int sobreNodo(double x1, double y1) {
    int pos = -1;
    for (int i = 0; i < vPuntosL.length; i++) {
      double dist =
          sqrt(pow(vPuntosL[i].x - x1, 2) + pow(vPuntosL[i].y - y1, 2));
      print("dist: ${dist}");
      if (dist <= vPuntosL[i].radio) {
        pos = i + 1;
        i = vPuntosL.length + 1;
      }
    }
    return pos;
  }
}

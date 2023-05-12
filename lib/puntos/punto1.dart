import 'package:flutter/material.dart';

class Punto1 extends StatefulWidget {
  const Punto1({Key? key}) : super(key: key);

  @override
  State<Punto1> createState() => _Punto1State();
}

class _Punto1State extends State<Punto1> {
  TextEditingController tecn1 = TextEditingController();
  TextEditingController tecn2 = TextEditingController();
  int numCaja = 1;
  int numCaja2 = 1;
  int numCaja3 = 1;

  int nivel = 1;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/pag3.jpg"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Puerto'),
          backgroundColor: Colors.black.withOpacity(0.7),
          centerTitle: true,
          elevation: 0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              if (nivel >= 1)
                Positioned(
                  top: 160, // define la posición en Y
                  left: 47, // define la posición en X
                  child: IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        numCaja += 1;
                        if (numCaja > 3) {
                          numCaja = 1;
                        }
                      });
                    },
                    iconSize: 20, // establecer el tamaño del icono a 40
                  ),
                ),
              Positioned(
                top: 280, // define la posición en Y
                left: 47, // define la posición en X
                child: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {
                      numCaja -= 1;
                      if (numCaja < 1) {
                        numCaja = 3;
                      }
                    });
                  },
                  iconSize: 20, // establecer el tamaño del icono a 40
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja == 1
                    ? 250 - 50
                    : numCaja == 2
                        ? 250 - 50
                        : 330 - 50,
                right: 297,
                bottom: screen.height - 330 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector1.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),

              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja == 1
                    ? 330 - 50
                    : numCaja == 2
                        ? 250 - 50
                        : 250 - 50,
                right: 297,
                bottom: screen.height - 330 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector2.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja == 1
                    ? 330 - 50
                    : numCaja == 2
                        ? 330 - 50
                        : 250 - 50,
                right: 297,
                bottom: screen.height - 330 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector3.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),

              if (nivel >= 4)
                Positioned(
                  top: 380 - 50, // define la posición en Y
                  left: 47, // define la posición en X
                  child: IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        numCaja2 += 1;
                        if (numCaja2 > 3) {
                          numCaja2 = 1;
                        }
                      });
                    },
                    iconSize: 20, // establecer el tamaño del icono a 40
                  ),
                ),
              if (nivel >= 4)
                Positioned(
                  top: 500 - 50, // define la posición en Y
                  left: 47, // define la posición en X
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      setState(() {
                        numCaja2 -= 1;
                        if (numCaja2 < 1) {
                          numCaja2 = 3;
                        }
                      });
                    },
                    iconSize: 20, // establecer el tamaño del icono a 40
                  ),
                ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja2 == 1
                    ? 420 - 50
                    : numCaja2 == 2
                        ? 420 - 50
                        : 500 - 50,
                right: 297,
                bottom: screen.height - 500 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector1.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja2 == 1
                    ? 500 - 50
                    : numCaja2 == 2
                        ? 420 - 50
                        : 420 - 50,
                right: 297,
                bottom: screen.height - 500 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector2.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja2 == 1
                    ? 500 - 50
                    : numCaja2 == 2
                        ? 500 - 50
                        : 420 - 50,
                right: 297,
                bottom: screen.height - 500 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector3.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              if (nivel >= 8)
                Positioned(
                  top: 550 - 50, // define la posición en Y
                  left: 47, // define la posición en X
                  child: IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        numCaja3 += 1;
                        if (numCaja3 > 3) {
                          numCaja3 = 1;
                        }
                      });
                    },
                    iconSize: 20, // establecer el tamaño del icono a 40
                  ),
                ),
              if (nivel >= 8)
                Positioned(
                  top: 665 - 50, // define la posición en Y
                  left: 47, // define la posición en X
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      setState(() {
                        numCaja3 -= 1;
                        if (numCaja3 < 1) {
                          numCaja3 = 3;
                        }
                      });
                    },
                    iconSize: 20, // establecer el tamaño del icono a 40
                  ),
                ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja3 == 1
                    ? 590 - 50
                    : numCaja3 == 2
                        ? 690 - 50
                        : 670 - 50,
                right: 297,
                bottom: screen.height - 670 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector1.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja3 == 1
                    ? 670 - 50
                    : numCaja3 == 2
                        ? 590 - 50
                        : 590 - 50,
                right: 297,
                bottom: screen.height - 670 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector2.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 30,
                top: numCaja3 == 1
                    ? 670 - 50
                    : numCaja3 == 2
                        ? 670 - 50
                        : 590 - 50,
                right: 297,
                bottom: screen.height - 670 - 50,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sector3.png'), // ruta de la imagen
                        fit: BoxFit
                            .cover, // ajustar la imagen al tamaño del contenedor
                      ),
                    ),
                  ),
                ),
              ),
              // Caja 1
              Positioned(
                top: 190,
                left: 140,
                child: Container(
                  width: 230,
                  height: 110,
                  color: Colors.white54,
                  child: Center(
                    child: Text(
                      numCaja == 1
                          ? 'Opcion 1'
                          : numCaja == 2
                              ? "Opcion 2"
                              : "opcion 3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              // Caja 2
              Positioned(
                top: 360,
                left: 140,
                child: Container(
                  width: 230,
                  height: 110,
                  color: Colors.white54,
                  child: Center(
                    child: Text(
                      numCaja2 == 1
                          ? 'Opcion 1'
                          : numCaja2 == 2
                              ? "Opcion 2"
                              : "opcion 3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              // Caja 3
              Positioned(
                top: 530,
                left: 140,
                child: Container(
                  width: 230,
                  height: 110,
                  color: Colors.white54,
                  child: Center(
                    child: Text(
                      numCaja3 == 1
                          ? 'Opcion 1'
                          : numCaja3 == 2
                              ? "Opcion 2"
                              : "opcion 3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              // Pregunta
              Positioned(
                top: 30,
                left: 50,
                child: Container(
                  width: 310,
                  height: 100,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "Pregunta",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                  top: 700 - 50, // define la posición en Y
                  right: 50, // define la posición en X
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.blue, // Define el color de fondo del botón
                        onPrimary: Colors
                            .white, // Define el color del texto dentro del botón
                      ),
                      onPressed: () {
                        setState(() {
                          nivel++;
                          if (nivel > 10) {
                            Text("Nivel Completado");
                            nivel = 1;
                          }
                        });
                      },
                      child: Text("Siguiente"))),
            ],
          ),
        ),
      ),
    );
  }

  ruleta() {}
}

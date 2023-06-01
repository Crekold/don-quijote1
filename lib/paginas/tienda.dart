import 'package:flutter/material.dart';

class Tienda extends StatefulWidget {
  const Tienda({Key? key}) : super(key: key);

  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  TextEditingController tecn1 = TextEditingController();
  TextEditingController tecn2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/tienda1.jpg"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Tienda'),
          backgroundColor: Colors.black.withOpacity(0.7),
          centerTitle: true,
          elevation: 0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0, // Posición vertical desde la parte superior
              left: 20, // Posición horizontal desde la izquierda
              child: Image.asset(
                'assets/images/Monedas.png',
                width: 80, // Ancho de la imagen
                height: 80, // Alto de la imagen
              ),
            ),
            Positioned(
              top: 37, // Posición vertical desde la parte superior
              left: 120, // Posición horizontal desde la izquierda
              child: Text(
                "Monedas: 100",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),

            // Item 1
            Positioned(
              top: 170, // Posición vertical desde la parte superior
              left: 50, // Posición horizontal desde la izquierda
              child: Image.asset(
                'assets/images/Guantes.png',
                width: 125, // Ancho de la imagen
                height: 125, // Alto de la imagen
              ),
            ),
            Positioned(
              top: 300, // define la posición en Y
              left: 70, // define la posición en X
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showInformationDialog(
                        context, "Guantes", 200, "Guantes para Don Quijote");
                  });
                },
                child: Text("Comprar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .transparent, // Establece el color de fondo transparente
                ),
              ),
            ),
            //Item 2
            Positioned(
              top: 170, // Posición vertical desde la parte superior
              left: 250, // Posición horizontal desde la izquierda
              child: Image.asset(
                'assets/images/Cosselete.png',
                width: 125, // Ancho de la imagen
                height: 125, // Alto de la imagen
              ),
            ),
            Positioned(
              top: 300, // define la posición en Y
              left: 280, // define la posición en X
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showInformationDialog(
                        context, "Coselete", 600, "Coselete para Don Quijote");
                  });
                },
                child: Text("Comprar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .transparent, // Establece el color de fondo transparente
                ),
              ),
            ),
            //Item 3
            Positioned(
              top: 425, // Posición vertical desde la parte superior
              left: 50, // Posición horizontal desde la izquierda
              child: Image.asset(
                'assets/images/Morrion.png',
                width: 125, // Ancho de la imagen
                height: 125, // Alto de la imagen
              ),
            ),
            Positioned(
              top: 550, // define la posición en Y
              left: 70, // define la posición en X
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showInformationDialog(
                        context, "Morrion", 400, "Morrion para Don Quijote");
                  });
                },
                child: Text("Comprar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .transparent, // Establece el color de fondo transparente
                ),
              ),
            ),
            //Item 4
            Positioned(
              top: 425, // Posición vertical desde la parte superior
              left: 250, // Posición horizontal desde la izquierda
              child: Image.asset(
                'assets/images/Escudo.png',
                width: 125, // Ancho de la imagen
                height: 125, // Alto de la imagen
              ),
            ),
            Positioned(
              top: 550, // define la posición en Y
              left: 280, // define la posición en X
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showInformationDialog(
                        context, "Escudo", 200, "Escudo para Don Quijote");
                  });
                },
                child: Text("Comprar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .transparent, // Establece el color de fondo transparente
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showInformationDialog(
      BuildContext context, String title, double precio, String descripcion) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(descripcion),
                  //SizedBox(height: 10),
                  Text("Costo: $precio"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                    // Lógica adicional al aceptar el mensaje de información
                  },
                  child: Text('Comprar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

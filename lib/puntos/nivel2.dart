import 'package:flutter/material.dart';
import 'dart:math';
import '/formas.dart';
import '/modelos.dart';

class Nivel2 extends StatefulWidget {
  const Nivel2({Key? key}) : super(key: key);

  @override
  State<Nivel2> createState() => _Nivel2State();
}

class _Nivel2State extends State<Nivel2> {
  bool borrar = false;
  List<Cuadpal> vPal = [];
  List<String> resp = [];
  List<String> corr = [
    "Verbo",
    "Iniciar con mayuscula",
    "Estructura",
    "Coherencia",
    "Terminar con punto seguido",
    "Sujeto y predicado",
  ];
  List<String> incorr = [
    "Coma",
    "Un nombre propio",
    "Ser muy extensa",
    "Usar signos de admiración",
    "Imaginación",
    "Objeto e instruido ",
  ];
  List<String> items = [];

  int pos = -1;
  int selectedIdx = -1;
  List<String> aux = [];

  @override
  void initState() {
    super.initState();
    aux.addAll(corr);
    aux.addAll(incorr);
    aux.shuffle(Random());
    items.addAll(aux);
  }

  Color colborr = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/FondoNivel2.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Punto 2'),
          backgroundColor: Colors.black.withOpacity(0.7),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Puntuacion',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        verificaResp(resp),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          child: Text('Entendido'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Objetivo',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Para empezar a escribir la carta, Don Quijote necesita saber qué características debe tener una oración correcta. ¿Qué elementos necesita una oración para estar correctamente redactada?',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          child: Text('Entendido'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: colborr,
              ),
              onPressed: () {
                setState(() {
                  borrar = !borrar;
                  colborr = borrar
                      ? Colors.red
                      : Colors.white; // Cambia los colores según el estado
                });
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            CustomPaint(
              painter: Rectangulo(vPal),
            ),
            GestureDetector(
              onTapDown: (des) {
                setState(() {
                  if (borrar) {
                    final touchPosition = des.globalPosition;
                    final textStyle = TextStyle(
                      color: Color.fromARGB(255, 255, 1, 200),
                      fontSize: 20,
                    );
                    int sis = -1;
                    String auxi = "";
                    for (int i = 0; i < vPal.length; i++) {
                      final textSpan = TextSpan(
                        text: vPal[i].msg,
                        style: textStyle,
                      );

                      final textPainter = TextPainter(
                        text: textSpan,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                      );

                      textPainter.layout();
                      final rect = Rect.fromCenter(
                        center: Offset(vPal[i].x, vPal[i].y - 3),
                        width: textPainter.width + 5,
                        height: 30,
                      );

                      if (rect.contains(touchPosition)) {
                        sis = i;
                        auxi = vPal[i].msg;
                        break;
                      }
                    }
                    if (sis >= 0) {
                      resp.remove(vPal[sis].msg);
                      vPal.removeAt(sis);
                      items.add(auxi);
                    }
                  } else {
                    if (selectedIdx >= 0) {
                      vPal.add(Cuadpal(des.globalPosition.dx,
                          des.globalPosition.dy, items[selectedIdx], 0));
                      resp.add(items[selectedIdx]);
                      items.removeAt(selectedIdx);
                      selectedIdx = -1;
                    }
                  }
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final option = items[index];
                return GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectedIdx = index == selectedIdx ? -1 : index;
                    });
                  },
                  child: Container(
                    width: 150,
                    color: index == selectedIdx
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 20,
                          color: index == selectedIdx
                              ? Colors.green
                              : Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String verificaResp(List<String> resp) {
    int buenas = 0;
    int punt = 0;
    String msg = "";
    for (int i = 0; i < resp.length; i++) {
      if (corr.contains(resp[i])) {
        buenas++;
        punt += 150;
      }
    }
    msg = "Tu puntuacion final es: " + punt.toString();
    msg += "\nCantidad de aciertos: " + buenas.toString();
    msg += "\nCantidad de fallos: " + (resp.length - buenas).toString();
    return msg;
  }
}

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
  List<dynamic> result = List.empty();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var valorLibro = pregunta1[1];
    var valorautor = pregunta1[2];
    var valortexto = pregunta1[3];
    var texto2xd = pregunta1[4];
    var opcion1 = pregunta1[5];
    var opcion2 = pregunta1[7];
    var opcion3 = pregunta2[8];
    var error11 = error1[2];
    var error21 = error2[2];
    var error1_1 = error3[3];
    var error2_2 = error4[3];
    List<dynamic> opciones1 = ["cita Corta", "cita larga", "Parafrasis"];
    List<dynamic> opciones2 = [opcion2, error11, error21];
    List<dynamic> preguntaxd = [valorLibro, valorautor, valortexto, texto2xd];
    String texto =
        'Tipo: ${preguntaxd[0]}\nAutor: ${preguntaxd[1]}\nNombre del texto: ${preguntaxd[2]}\nTexto: ${preguntaxd[3]}';
    String texto2 = opciones1.join(',');
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
                          ? opciones1[0]
                          : numCaja == 2
                              ? opciones1[1]
                              : opciones1[2],
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
                          ? opcion2
                          : numCaja2 == 2
                              ? error11
                              : error21,
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
                          ? opcion3
                          : numCaja3 == 2
                              ? error1_1
                              : error2_2,
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
                      "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 30,
                left: 50,
                child: Container(
                  width: 310,
                  height: 100,
                  color: Colors.transparent,
                  child: Center(
                    child: SingleChildScrollView(
                      // Agregar un widget de desplazamiento
                      child: Text(
                        texto, // Usar la cadena aquí
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center, // Centrar el texto
                        softWrap:
                            true, // Permitir que el texto se ajuste a nuevas líneas
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

  List<dynamic> pregunta1 = [
    1,
    'Libro',
    'George Stainer',
    'Gramaticas De La Creación',
    2011,
    'No tenemos mitos, no tenemos imágenes de una deidad que no crea. Como veremos, en ciertas etapas de la teología, algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación, que se separó de ella o que tuvo el impulso de aniquilarla (éste es el sombrío telón de fondo de numerosas fábulas sobre el diluvio o el fuego universales). Sin embargo nuestras definiciones de lo divino son, no lógica pero sí tautológicamente, idénticas al atributo de creatividad.',
    'Cita corta',
    'Podríamos pensar que dios siempre está orgullos de su obra, pero como dice Steniere (2011) “algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación” (p.17). Es el propósito de esta investigación identificar las características de estas experiencias.',
    'Steiner, G. (2011). Gramaticas De La Creacion. Editorial Graó.'
    // Additional methods for myTable can be added here
  ];

  List<dynamic> pregunta2 = [
    2,
    'Artículo de revista académica en linea',
    'Jacinto Gonzáles Cobas',
    'Estudio sobre el párrafo',
    2004,
    'Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. En efecto, se trata de campos de estudio muy diferentes, que hemos relacionado para aprovechar al máximo las investigaciones llevadas a cabo por algunos autores.',
    'Cita larga',
    'Como se ha discutirdo anteriormente, el párrafo existe no solo por motivo lingüísticos Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. (González Cobas, 2004, p. 93) Por lo que pensar que su existencia solo tiene que ver con temas de escritura sería errado.',
    'González, J. (2004). Estudio sobre el párrafo. ELUA, 18, 87. https://doi.org/10.14198/ELUA2004.18.05'
  ];

  List<dynamic> pregunta3 = [
    3,
    'Libro',
    'William Shakespeare',
    'Hamlet',
    2015,
    '"HAMLET Ay, Horacio, me muero; el potente veneno subyuga ya mi espíritu. No alcanzaré a vivir para oír las noticias de Inglaterra,  mas vaticino que la votación recaerá en Fortinbrás; tiene mi voto moribundo. Díselo pues, así como las circunstancias  mayores y menores que me solicitaron. Lo demás es silencio."',
    'Cita corta',
    'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  ];
  List<dynamic> pregunta4 = [
    4,
    'Libro',
    'Emil Cioran',
    'El ocaso del pensamiento ',
    2014,
    'Utiliza la razón mientras estés a tiempo.',
    'Cita corta',
    'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  ];
  List<dynamic> pregunta5 = [
    5,
    'Libro',
    'Irina Alzari, Ana Brown, Florencia Coppolecchia, Patricia Escandar, Julián DAlesandro, Martha Esther Faiad, Juan Pablo Moris, Lucía Natale, Federico Navarro, Inés Gimena Pérez, Marina Peruani San Román, Rubén Pose, Maricel Radiminiski, Matías Raia, Daniela Stagnaro, Miranda Trincheri',
    'Manual de escritura para carreras de humanidades',
    2014,
    'Para superar la dicotomía teoría-practica, en la didáctica de nivel superior es muy común el uso de trabajos de campo como estrategia de enseñanza y evaluación. En los profesorados y en la Licenciatura en Ciencias de la Educación, el trabajo de campo es una instancia curricular con entidad propia. Asimismo, muchas asignaturas proponen durante sus cursadas alguna experiencia en territorio. Aprender a escribir este nuevo género de formación implica incorporar nuevos modos de pensar y otras habilidades profesionales del Licenciado en Ciencias de la Educación.',
    'Cita corta',
    'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita “incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    'Alzari, I., Brown, A., Coppolecchia, F., Escandar, P. C., D’Alessandro, J., Faiad, M. E., Moris, J. P., Natale, L., Navarro, F., Pérez, I. G., Román, M. P. S., Pose, R., Radiminski, M., Raia, M. H., Stagnaro, D. y Trincheri, M. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  ];
  List<dynamic> pregunta6 = [
    6,
    'Página Web',
    'Jean McNiff',
    'Action research, transformational influences: pasts, presents and futures',
    2008,
    'What I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis, as I now explain. I will explain this by doing some historical work, and speaking about how different views have emerged.',
    'Cita corta',
    'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  ];

  List<dynamic> error1 = [
    1,
    3,
    'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  ];
  List<dynamic> error2 = [
    2,
    3,
    'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  ];
  List<dynamic> error3 = [
    3,
    4,
    'En El ocaso del pensamiento Cioran (2014, p.137)  advierte “Utiliza la razón mientras estés a tiempo”. Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  ];
  List<dynamic> error4 = [
    4,
    4,
    'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    'En El ocaso del pensamiento Cioran advierte “Utiliza la razón mientras estés a tiempo” (Cioran, 2014, p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.'
  ];
  List<dynamic> error5 = [
    5,
    5,
    'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  ];

  List<dynamic> error6 = [
    6,
    5,
    '"Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  ];
  List<dynamic> error7 = [
    7,
    6,
    'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “lo que he esbozado presenta una visión de la investigación-acción. Existen otros puntos de vista, algunos de los cuales creo que están limitados en su alcance y grado de análisis teórico”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    'McNiff, Jean. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  ];
  List<dynamic> error8 = [
    8,
    6,
    'Pese a la claridad con las que McNiff expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis” (2008), por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  ];
}

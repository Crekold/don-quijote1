import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'login.db';
  static final _dbVersion = 1;
  static final _tableNameUsers = 'users';
  static final _tableNameMyTable = 'preguntas';
  static final _tableNameMyTable2 = 'preguntasmalas';

  // User table columns
  static final columnId = '_id';
  static final columnUsername = 'username';
  static final columnPassword = 'password';

  // myTable columns
  static final columnPregunta = 'pregunta';
  static final columnNivel = 'nivel';
  static final columnTipoDeTexto = 'tipo_de_texto';
  static final columnAutor = 'autor';
  static final columnTitulo = 'titulo';
  static final columnAno = 'ano';
  static final columnTexto = 'texto';
  static final columnTipoDeCita = 'tipo_de_cita';
  static final columnCita = 'cita';
  static final columnReferencia = 'referencia';

  // myTable2 columns
  static final columnId2 = 'id';
  static final columnIdpregunta = 'pregunta_id_pregunta';
  static final columncita2= 'cita';
  static final columnreferencia2 = 'referencia';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('PRAGMA foreign_keys = ON');
    await db.execute('''
      CREATE TABLE $_tableNameUsers (
        $columnUsername TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE preguntas (
        $columnId INTEGER PRIMARY KEY,
        $columnTipoDeTexto TEXT NOT NULL,
        $columnAutor TEXT NOT NULL,
        $columnTitulo TEXT NOT NULL,
        $columnAno INTEGER NOT NULL,
        $columnTexto TEXT NOT NULL,
        $columnTipoDeCita TEXT NOT NULL,
        $columnCita TEXT NOT NULL,
        $columnReferencia TEXT NOT NULL
      )
      ''');
    await db.execute('''
      CREATE TABLE $_tableNameMyTable2 (
        $columnId2 INTEGER PRIMARY KEY,
        $columnIdpregunta INTEGER NOT NULL,
        $columncita2 TEXT NOT NULL,
        $columnreferencia2 TEXT NOT NULL,
        FOREIGN KEY ($columnIdpregunta) REFERENCES $_tableNameMyTable($columnId)
      )
      ''');

    DatabaseHelper.instance.insertUser(user);
    DatabaseHelper.instance.insertMyTableData(pregunta1);
    DatabaseHelper.instance.insertMyTableData(pregunta2);
    DatabaseHelper.instance.insertMyTableData(pregunta3);
    DatabaseHelper.instance.insertMyTableData(pregunta4);
    DatabaseHelper.instance.insertMyTableData(pregunta5);
    DatabaseHelper.instance.insertMyTableData(pregunta6);

    DatabaseHelper.instance.insertMyTableData2(error1);
    DatabaseHelper.instance.insertMyTableData2(error2);
    DatabaseHelper.instance.insertMyTableData2(error3);
    DatabaseHelper.instance.insertMyTableData2(error4);
    DatabaseHelper.instance.insertMyTableData2(error5);
    DatabaseHelper.instance.insertMyTableData2(error6);
    DatabaseHelper.instance.insertMyTableData2(error7);
    DatabaseHelper.instance.insertMyTableData2(error8);
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableNameUsers, row);
  }
  Future<int> insertMyTableData(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableNameMyTable, row);

  }
  Future<int> insertMyTableData2(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableNameMyTable2, row);
  }


  Future<List<Map<String, dynamic>>> queryUser(String username) async {
    Database db = await instance.database;

    return await db.query(
      _tableNameUsers,
      where: '$columnUsername = ?',
      whereArgs: [username],
    );
  }

  Future<List<dynamic>> queryMyTableData() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> resultMapList = await db.rawQuery('SELECT * FROM $_tableNameMyTable ORDER BY RANDOM() LIMIT 1');

    // Obtener los valores de la columna deseada y devolverlos en una lista
    List<dynamic> resultList = resultMapList.map((map) => map.values).toList();

    return resultList;
  }


  Future<List<Map<String, dynamic>>> queryMyTableData2() async {
    Database db = await instance.database;

    return await db.rawQuery('SELECT * FROM $_tableNameMyTable2 ORDER BY RANDOM() LIMIT 1');
  }

  Map<String, dynamic> user = {
    DatabaseHelper.columnUsername: 'admin',
    DatabaseHelper.columnPassword: 'admin',
  };

  Map<String, dynamic> pregunta1 = {
    DatabaseHelper.columnId: 1,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'George Stainer',
    DatabaseHelper.columnTitulo: 'Gramaticas De La Creación',
    DatabaseHelper.columnAno: 2011,
    DatabaseHelper.columnTexto: 'No tenemos mitos, no tenemos imágenes de una deidad que no crea. Como veremos, en ciertas etapas de la teología, algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación, que se separó de ella o que tuvo el impulso de aniquilarla (éste es el sombrío telón de fondo de numerosas fábulas sobre el diluvio o el fuego universales). Sin embargo nuestras definiciones de lo divino son, no lógica pero sí tautológicamente, idénticas al atributo de creatividad.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Podríamos pensar que dios siempre está orgullos de su obra, pero como dice Steniere (2011) “algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación” (p.17). Es el propósito de esta investigación identificar las características de estas experiencias.',
    DatabaseHelper.columnReferencia: 'Steiner, G. (2011). Gramaticas De La Creacion. Editorial Graó.'
    // Additional methods for myTable can be added here

  };



  Map<String, dynamic> pregunta2 = {
    DatabaseHelper.columnId: 2,
    DatabaseHelper.columnTipoDeTexto: 'Artículo de revista académica en linea',
    DatabaseHelper.columnAutor: 'Jacinto Gonzáles Cobas',
    DatabaseHelper.columnTitulo: 'Estudio sobre el párrafo',
    DatabaseHelper.columnAno: 2004,
    DatabaseHelper.columnTexto: 'Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. En efecto, se trata de campos de estudio muy diferentes, que hemos relacionado para aprovechar al máximo las investigaciones llevadas a cabo por algunos autores.',
    DatabaseHelper.columnTipoDeCita: 'Cita larga',
    DatabaseHelper.columnCita: 'Como se ha discutirdo anteriormente, el párrafo existe no solo por motivo lingüísticos Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. (González Cobas, 2004, p. 93) Por lo que pensar que su existencia solo tiene que ver con temas de escritura sería errado.',
    DatabaseHelper.columnReferencia:'González, J. (2004). Estudio sobre el párrafo. ELUA, 18, 87. https://doi.org/10.14198/ELUA2004.18.05'
  };

  Map<String, dynamic> pregunta3={
    DatabaseHelper.columnId: 3,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'William Shakespeare',
    DatabaseHelper.columnTitulo: 'Hamlet',
    DatabaseHelper.columnAno: 2015,
    DatabaseHelper.columnTexto: '"HAMLET Ay, Horacio, me muero; el potente veneno subyuga ya mi espíritu. No alcanzaré a vivir para oír las noticias de Inglaterra,  mas vaticino que la votación recaerá en Fortinbrás; tiene mi voto moribundo. Díselo pues, así como las circunstancias  mayores y menores que me solicitaron. Lo demás es silencio."',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnReferencia:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> pregunta4={
    DatabaseHelper.columnId: 4,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'Emil Cioran',
    DatabaseHelper.columnTitulo: 'El ocaso del pensamiento ',
    DatabaseHelper.columnAno: 2014,
    DatabaseHelper.columnTexto: 'Utiliza la razón mientras estés a tiempo.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnReferencia:'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  };
  Map<String, dynamic> pregunta5={
    DatabaseHelper.columnId: 5,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'Irina Alzari, Ana Brown, Florencia Coppolecchia, Patricia Escandar, Julián DAlesandro, Martha Esther Faiad, Juan Pablo Moris, Lucía Natale, Federico Navarro, Inés Gimena Pérez, Marina Peruani San Román, Rubén Pose, Maricel Radiminiski, Matías Raia, Daniela Stagnaro, Miranda Trincheri',
    DatabaseHelper.columnTitulo: 'Manual de escritura para carreras de humanidades',
    DatabaseHelper.columnAno: 2014,
    DatabaseHelper.columnTexto: 'Para superar la dicotomía teoría-practica, en la didáctica de nivel superior es muy común el uso de trabajos de campo como estrategia de enseñanza y evaluación. En los profesorados y en la Licenciatura en Ciencias de la Educación, el trabajo de campo es una instancia curricular con entidad propia. Asimismo, muchas asignaturas proponen durante sus cursadas alguna experiencia en territorio. Aprender a escribir este nuevo género de formación implica incorporar nuevos modos de pensar y otras habilidades profesionales del Licenciado en Ciencias de la Educación.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita “incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnReferencia:'Alzari, I., Brown, A., Coppolecchia, F., Escandar, P. C., D’Alessandro, J., Faiad, M. E., Moris, J. P., Natale, L., Navarro, F., Pérez, I. G., Román, M. P. S., Pose, R., Radiminski, M., Raia, M. H., Stagnaro, D. y Trincheri, M. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };
  Map<String, dynamic> pregunta6={
    DatabaseHelper.columnId: 6,
    DatabaseHelper.columnTipoDeTexto: 'Página Web',
    DatabaseHelper.columnAutor: 'Jean McNiff',
    DatabaseHelper.columnTitulo: 'Action research, transformational influences: pasts, presents and futures',
    DatabaseHelper.columnAno: 2008,
    DatabaseHelper.columnTexto: 'What I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis, as I now explain. I will explain this by doing some historical work, and speaking about how different views have emerged.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnReferencia:'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };

  Map<String, dynamic> error1={
    DatabaseHelper.columnId2: 1,
    DatabaseHelper.columnIdpregunta : 3,
    DatabaseHelper.columncita2: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnreferencia2:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> error2={
    DatabaseHelper.columnId2:2,
    DatabaseHelper.columnIdpregunta : 3,
    DatabaseHelper.columncita2: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnreferencia2:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> error3={
    DatabaseHelper.columnId2:3,
    DatabaseHelper.columnIdpregunta : 4,
    DatabaseHelper.columncita2: 'En El ocaso del pensamiento Cioran (2014, p.137)  advierte “Utiliza la razón mientras estés a tiempo”. Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnreferencia2:'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  };
  Map<String, dynamic> error4={
    DatabaseHelper.columnId2:4,
    DatabaseHelper.columnIdpregunta : 4,
    DatabaseHelper.columncita2: 'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnreferencia2:'En El ocaso del pensamiento Cioran advierte “Utiliza la razón mientras estés a tiempo” (Cioran, 2014, p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.'
  };
  Map<String, dynamic> error5={
    DatabaseHelper.columnId2:5,
    DatabaseHelper.columnIdpregunta : 5,
    DatabaseHelper.columncita2: 'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnreferencia2:'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };

  Map<String, dynamic> error6={
    DatabaseHelper.columnId2:6,
    DatabaseHelper.columnIdpregunta : 5,
    DatabaseHelper.columncita2: '"Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnreferencia2:'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };
  Map<String, dynamic> error7={
    DatabaseHelper.columnId2:7,
    DatabaseHelper.columnIdpregunta : 6,
    DatabaseHelper.columncita2: 'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “lo que he esbozado presenta una visión de la investigación-acción. Existen otros puntos de vista, algunos de los cuales creo que están limitados en su alcance y grado de análisis teórico”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnreferencia2:'McNiff, Jean. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };
  Map<String, dynamic> error8={
    DatabaseHelper.columnId2:8,
    DatabaseHelper.columnIdpregunta : 6,
    DatabaseHelper.columncita2: 'Pese a la claridad con las que McNiff expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis” (2008), por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnreferencia2:'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };

}
class MyClass {
  Map<String, dynamic> pregunta1 = {
    DatabaseHelper.columnId: 1,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'George Stainer',
    DatabaseHelper.columnTitulo: 'Gramaticas De La Creación',
    DatabaseHelper.columnAno: 2011,
    DatabaseHelper.columnTexto: 'No tenemos mitos, no tenemos imágenes de una deidad que no crea. Como veremos, en ciertas etapas de la teología, algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación, que se separó de ella o que tuvo el impulso de aniquilarla (éste es el sombrío telón de fondo de numerosas fábulas sobre el diluvio o el fuego universales). Sin embargo nuestras definiciones de lo divino son, no lógica pero sí tautológicamente, idénticas al atributo de creatividad.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Podríamos pensar que dios siempre está orgullos de su obra, pero como dice Steniere (2011) “algunas experiencias intelectuales, místicas y subversivas han afirmado que Dios se arrepintió de la creación” (p.17). Es el propósito de esta investigación identificar las características de estas experiencias.',
    DatabaseHelper.columnReferencia: 'Steiner, G. (2011). Gramaticas De La Creacion. Editorial Graó.'
    // Additional methods for myTable can be added here

  };



  Map<String, dynamic> pregunta2 = {
    DatabaseHelper.columnId: 2,
    DatabaseHelper.columnTipoDeTexto: 'Artículo de revista académica en linea',
    DatabaseHelper.columnAutor: 'Jacinto Gonzáles Cobas',
    DatabaseHelper.columnTitulo: 'Estudio sobre el párrafo',
    DatabaseHelper.columnAno: 2004,
    DatabaseHelper.columnTexto: 'Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. En efecto, se trata de campos de estudio muy diferentes, que hemos relacionado para aprovechar al máximo las investigaciones llevadas a cabo por algunos autores.',
    DatabaseHelper.columnTipoDeCita: 'Cita larga',
    DatabaseHelper.columnCita: 'Como se ha discutirdo anteriormente, el párrafo existe no solo por motivo lingüísticos Análisis realizados desde perspectivas muy diversas y bajo objetivos y prismas muy distintos arrojan luz sobre el hecho de que la existencia de los párrafos no está ligada (al menos únicamente) a factores de tipo personal o estilístico, sino que se trata de una unidad lingüística con un correlato cognitivo que la habilita como tal. (González Cobas, 2004, p. 93) Por lo que pensar que su existencia solo tiene que ver con temas de escritura sería errado.',
    DatabaseHelper.columnReferencia:'González, J. (2004). Estudio sobre el párrafo. ELUA, 18, 87. https://doi.org/10.14198/ELUA2004.18.05'
  };

  Map<String, dynamic> pregunta3={
    DatabaseHelper.columnId: 3,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'William Shakespeare',
    DatabaseHelper.columnTitulo: 'Hamlet',
    DatabaseHelper.columnAno: 2015,
    DatabaseHelper.columnTexto: '"HAMLET Ay, Horacio, me muero; el potente veneno subyuga ya mi espíritu. No alcanzaré a vivir para oír las noticias de Inglaterra,  mas vaticino que la votación recaerá en Fortinbrás; tiene mi voto moribundo. Díselo pues, así como las circunstancias  mayores y menores que me solicitaron. Lo demás es silencio."',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnReferencia:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> pregunta4={
    DatabaseHelper.columnId: 4,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'Emil Cioran',
    DatabaseHelper.columnTitulo: 'El ocaso del pensamiento ',
    DatabaseHelper.columnAno: 2014,
    DatabaseHelper.columnTexto: 'Utiliza la razón mientras estés a tiempo.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnReferencia:'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  };
  Map<String, dynamic> pregunta5={
    DatabaseHelper.columnId: 5,
    DatabaseHelper.columnTipoDeTexto: 'Libro',
    DatabaseHelper.columnAutor: 'Irina Alzari, Ana Brown, Florencia Coppolecchia, Patricia Escandar, Julián DAlesandro, Martha Esther Faiad, Juan Pablo Moris, Lucía Natale, Federico Navarro, Inés Gimena Pérez, Marina Peruani San Román, Rubén Pose, Maricel Radiminiski, Matías Raia, Daniela Stagnaro, Miranda Trincheri',
    DatabaseHelper.columnTitulo: 'Manual de escritura para carreras de humanidades',
    DatabaseHelper.columnAno: 2014,
    DatabaseHelper.columnTexto: 'Para superar la dicotomía teoría-practica, en la didáctica de nivel superior es muy común el uso de trabajos de campo como estrategia de enseñanza y evaluación. En los profesorados y en la Licenciatura en Ciencias de la Educación, el trabajo de campo es una instancia curricular con entidad propia. Asimismo, muchas asignaturas proponen durante sus cursadas alguna experiencia en territorio. Aprender a escribir este nuevo género de formación implica incorporar nuevos modos de pensar y otras habilidades profesionales del Licenciado en Ciencias de la Educación.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita “incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnReferencia:'Alzari, I., Brown, A., Coppolecchia, F., Escandar, P. C., D’Alessandro, J., Faiad, M. E., Moris, J. P., Natale, L., Navarro, F., Pérez, I. G., Román, M. P. S., Pose, R., Radiminski, M., Raia, M. H., Stagnaro, D. y Trincheri, M. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };
  Map<String, dynamic> pregunta6={
    DatabaseHelper.columnId: 6,
    DatabaseHelper.columnTipoDeTexto: 'Página Web',
    DatabaseHelper.columnAutor: 'Jean McNiff',
    DatabaseHelper.columnTitulo: 'Action research, transformational influences: pasts, presents and futures',
    DatabaseHelper.columnAno: 2008,
    DatabaseHelper.columnTexto: 'What I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis, as I now explain. I will explain this by doing some historical work, and speaking about how different views have emerged.',
    DatabaseHelper.columnTipoDeCita: 'Cita corta',
    DatabaseHelper.columnCita: 'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnReferencia:'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };

  Map<String, dynamic> error1={
    DatabaseHelper.columnId2: 1,
    DatabaseHelper.columnIdpregunta : 3,
    DatabaseHelper.columncita2: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p, 360). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnreferencia2:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> error2={
    DatabaseHelper.columnId2:2,
    DatabaseHelper.columnIdpregunta : 3,
    DatabaseHelper.columncita2: 'En 1961 se escribe Hamlet, es precisamente Hamlet quien dice “Lo demás es silencio” (Shakespeare, 2015, p). Siglos después esa frase daría pie al título del libro de Monterroso Lo demás es silencio: La vida y la obra de Eduardo Torres.',
    DatabaseHelper.columnreferencia2:'Shakespeare, W. (2015). Hamlet (T. Segovia, Trad.; Edición bilingüe). Penguin Clásicos.'
  };
  Map<String, dynamic> error3={
    DatabaseHelper.columnId2:3,
    DatabaseHelper.columnIdpregunta : 4,
    DatabaseHelper.columncita2: 'En El ocaso del pensamiento Cioran (2014, p.137)  advierte “Utiliza la razón mientras estés a tiempo”. Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnreferencia2:'Cioran, E. M. (2014). El ocaso del pensamiento (J. Garrigós, Trad.; 3a. ed). Tusquets.'
  };
  Map<String, dynamic> error4={
    DatabaseHelper.columnId2:4,
    DatabaseHelper.columnIdpregunta : 4,
    DatabaseHelper.columncita2: 'En El ocaso del pensamiento Cioran (2014)  advierte “Utiliza la razón mientras estés a tiempo” (p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.',
    DatabaseHelper.columnreferencia2:'En El ocaso del pensamiento Cioran advierte “Utiliza la razón mientras estés a tiempo” (Cioran, 2014, p. 137). Aunque haya sido en 1940 cuando Ciorán escribió eso, su advertencia tiene total vigencia en nuestro contexto.'
  };
  Map<String, dynamic> error5={
    DatabaseHelper.columnId2:5,
    DatabaseHelper.columnIdpregunta : 5,
    DatabaseHelper.columncita2: 'Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnreferencia2:'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };

  Map<String, dynamic> error6={
    DatabaseHelper.columnId2:6,
    DatabaseHelper.columnIdpregunta : 5,
    DatabaseHelper.columncita2: '"Llevar a cabo un informe de trabajo de campo no es una tarea fácil, para conseguirlo el estudiante necesita incorporar nuevos modos de pensar y otras habilidades profesionales” (Alzari et al., 2014, p. 321). Por eso materias como Escritura Académica son necesarias.',
    DatabaseHelper.columnreferencia2:'Alzari, I., Brown, A., et al. (2014). Manual de escritura para carreras de humanidades (F. Navarro, Ed.; 1a edición). Editorial de la Facultad de Filosofía y Letras Universidad de Buenos Aires.'
  };
  Map<String, dynamic> error7={
    DatabaseHelper.columnId2:7,
    DatabaseHelper.columnIdpregunta : 6,
    DatabaseHelper.columncita2: 'Pese a la claridad con las que McNiff (2008) expone sus ideas, es importante recordar que ella misma adminte que “lo que he esbozado presenta una visión de la investigación-acción. Existen otros puntos de vista, algunos de los cuales creo que están limitados en su alcance y grado de análisis teórico”, por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnreferencia2:'McNiff, Jean. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };
  Map<String, dynamic> error8={
    DatabaseHelper.columnId2:8,
    DatabaseHelper.columnIdpregunta : 6,
    DatabaseHelper.columncita2: 'Pese a la claridad con las que McNiff expone sus ideas, es importante recordar que ella misma adminte que “what I have outlined presents one view of action research. Other views exist, some of which I believe are limited in their scope and degree of theoretical analysis” (2008), por lo que es conveniente analizar otros puntos de vistas sobre qué es la Investigación Acción.',
    DatabaseHelper.columnreferencia2:'McNiff, J. (2008, mayo). Action research, transformational influences: Pasts, presents and futures. Action research, transformational influences: pasts, presents and futures. http://www.jeanmcniff.com/items.asp?id=11'
  };

  // Puedes agregar tantas preguntas como necesites de la misma manera

  List<dynamic> convertMapToList(Map<String, dynamic> pregunta) {
    return pregunta.values.toList();
  }

  List<Map<String, dynamic>> convertMapToListWithKeys(Map<String, dynamic> pregunta) {
    return pregunta.entries.map((entry) {
      return {entry.key: entry.value};
    }).toList();
  }
}

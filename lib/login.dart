import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/FondoLogin.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('LOGIN'),
          backgroundColor: Colors.black.withOpacity(0.7),
          centerTitle: true,
          elevation: 0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centra verticalmente los widgets
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      style: TextStyle(
                        fontSize: 20, // Cambia el tamaño de fuente a 20
                      ),
                      decoration: InputDecoration(
                        labelText: "Usuario",
                        labelStyle: TextStyle(
                          color:
                              Colors.white, // Cambia el color del texto a rojo
                          //fontSize: 16, // Cambia el tamaño del texto a 18
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduzca su nombre de usuario';
                        }
                        return null;
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        fontSize: 20, // Cambia el tamaño de fuente a 20
                      ),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          color:
                              Colors.white, // Cambia el color del texto a rojo
                          //fontSize: 16, // Cambia el tamaño del texto a 18
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduzca su contraseña';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var username = _usernameController.text;
                          var password = _passwordController.text;
                          var user =
                              await DatabaseHelper.instance.queryUser(username);

                          if (user.isNotEmpty &&
                              user.first[DatabaseHelper.columnPassword] ==
                                  password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Inicio de sesión exitoso')));
                            Navigator.pushNamed(context, '/Home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Nombre de usuario o contraseña incorrecta')));
                          }
                        }
                      },
                      child: Text('Iniciar sesión'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                            .transparent), // Cambia el color de fondo a azul
                        minimumSize: MaterialStateProperty.all(Size(200,
                            50)), // Cambia el tamaño mínimo del botón a 200x50
                        textStyle: MaterialStateProperty.all(TextStyle(
                            color: Colors.white,
                            fontSize: 25 // Cambia el color del texto a blanco
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginModel extends ChangeNotifier {}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DatabaseHelper.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduzca su nombre de usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduzca su contraseña';
                  }
                  return null;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var username = _usernameController.text;
                    var password = _passwordController.text;
                    var user =
                        await DatabaseHelper.instance.queryUser(username);

                    if (user.isNotEmpty &&
                        user.first[DatabaseHelper.columnPassword] == password) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Inicio de sesión exitoso')));
                      Navigator.pushNamed(context, '/Home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Nombre de usuario o contraseña incorrecta')));
                    }
                  }
                },
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginModel extends ChangeNotifier {}

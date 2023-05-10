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
          title: Text('Puerto'),
          backgroundColor: Colors.black.withOpacity(0.7),
          centerTitle: true,
          elevation: 0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(),
      ),
    );
  }
}

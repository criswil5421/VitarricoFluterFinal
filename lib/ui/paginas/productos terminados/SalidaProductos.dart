
import 'package:calidad_servicioupeu/ui/paginas/MateriasPrimas.dart';
import 'package:calidad_servicioupeu/ui/paginas/ProductosTerminados.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalidaProductos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Center(child: menu()),
      routes: {
        '/materia': (context) => materiaprimas(),
        '/producto': (context) => productosterminados(),
      },
    );
  }
}

class menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Almacenes"),),
        ),
        body: Center(
          child: Text("hola"),
        )
    );
  }

}

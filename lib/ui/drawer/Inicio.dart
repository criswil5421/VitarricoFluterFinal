
import 'package:calidad_servicioupeu/ui/paginas/MateriasPrimas.dart';
import 'package:calidad_servicioupeu/ui/paginas/ProductosTerminados.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class inicio extends StatelessWidget{
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
          title: Center(child: Text("Inventario"),),
        ),
        body: Center(
          child: Center(
            child: Column(
              children: [
                new Container(
                  child: RaisedButton(
                      child: Text('Ir a productos'),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/producto');
                      }
                  ),
                ),

                new Container(
                  child: RaisedButton(
                      child: Text('Ir a materias primas'),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/materia');
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}

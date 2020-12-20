
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

                Container(
                  padding:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),

                  child: Image.asset(
                    'assets/proyecto/materiaprima.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                new Container(

                  padding:
                  EdgeInsets.only(top: 6.0),

                  width: 180,
                  height: 40,

                  child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      color: Colors.red,
                      textColor: Colors.yellow,
                      splashColor: Colors.grey,

                      child: Text('materias primas'),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/materia');
                      }
                  ),
                ),

                Container(
                  padding:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),

                  child: Image.asset(
                    'assets/proyecto/productoterminado.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                new Container(

                  padding:
                  EdgeInsets.only(top: 6.0),

                  width: 180,
                  height: 40,

                  child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      color: Colors.red,
                      textColor: Colors.yellow,
                      splashColor: Colors.grey,

                      child: Text('productos terminados'),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/producto');
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

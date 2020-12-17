
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class materiaprimas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Container(child: materia()),
    );
  }
}

class materia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("materias primaas"),),
        ),
      body: Container(

        child: SafeArea(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              Column(

                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,


                children: [



                  new Container(
                    child: Image.asset(
                      'assets/proyecto/carrito.jpg',
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                        child: Text('Realizar Pedido'),
                        /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/harina.png',
                      width: 125,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Harina'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/leche.jpg',
                      width: 125,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Leche'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/vainilla.jpg',
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Vainilla'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                ],
              ),
              Column(


                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/productoterminado.jpg',
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Salida de Producto'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/aceite.jpg',
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Aceite'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/ecencia.jpg',
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Escencia'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(
                    child: Image.asset(
                      'assets/proyecto/azucar.jpg',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(
                    child: RaisedButton(
                      child: Text('Azucar'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                ],
              ),
              //Icon(Icons.work_off),
            ],
          ),
        ),
      )
    );
  }
}



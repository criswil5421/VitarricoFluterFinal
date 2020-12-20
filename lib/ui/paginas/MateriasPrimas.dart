

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

        padding:
        EdgeInsets.only(left: 16.0, right: 16.0),

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

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/carrito.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 160,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      color: Colors.red,
                      textColor: Colors.yellow,
                      splashColor: Colors.grey,

                        child: Text('Realizar Pedido'),
                        /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/harina.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      child: Text('Harina'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/leche.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      child: Text('Leche'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/vainilla.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

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

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/productosalida.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 160,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      child: Text('Salida de Producto'),

                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/almacenproductos');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/aceite.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      child: Text('Aceite'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/ecencia.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

                      child: Text('Escencia'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/azucar.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Container(

                    width: 135,
                    height: 37,

                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),

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



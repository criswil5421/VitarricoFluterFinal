import 'package:calidad_servicioupeu/ui/paginas/productos%20terminados/SalidaProductos.dart';
import 'package:calidad_servicioupeu/ui/paginas/productos%20terminados/productostermi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class productosterminados extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Center(child: productos()),
      routes: {
        '/almacenproductos': (context) => SalidaProductos(),
        '/productostermi': (context) => productostermi(),
      },
    );
  }
}
class productos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("productos terminados"),),
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

                      child: Text('Agregar Productos'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/granola.jpg',
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

                      child: Text('granola'),

                      onPressed: (){

                          Navigator.of(context).pushNamed('/productostermi', arguments: {'myData': 'gloria'});

                        }
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/cereal.jpg',
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

                      child: Text('Cereal'),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/productostermi', arguments: {'myData': 'Lucho'});
                        }
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/arroz.jpg',
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

                      child: Text('Arroz coco'),
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
                      'assets/proyecto/productoterminado.jpg',
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
                      onPressed: (){
                          Navigator.of(context).pushNamed('/almacenproductos');
                        }
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/vitavena.jpg',
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

                      child: Text('Vitavena'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/salvado.jpg',
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

                      child: Text('Salvado de Trigo'),
                      /*onPressed: (){
                          Navigator.of(context).pushNamed('/materia');
                        }*/
                    ),
                  ),
                  new Container(

                    margin:
                    EdgeInsets.only(top: 6.0),

                    child: Image.asset(
                      'assets/proyecto/soya.jpg',
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

                      child: Text('Leche de soya'),

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
      ),
    );
  }
}

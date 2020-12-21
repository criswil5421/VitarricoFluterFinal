
import 'package:calidad_servicioupeu/api/api_pro1.dart';
import 'package:calidad_servicioupeu/ui/Proveedor/main_proveedor.dart';
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/ui/Proveedor/proveedor_main.dart';
import 'package:calidad_servicioupeu/ui/paginas/MateriasPrimas.dart';
import 'package:calidad_servicioupeu/ui/paginas/ProductosTerminados.dart';
import 'package:calidad_servicioupeu/ui/pro1/list_pro1.dart';
import 'package:calidad_servicioupeu/ui/pro1/lista_productos_nombre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productostermi extends StatelessWidget{

  /*String argume;
  productostermi(this.argume);*/

  Widget screenView;
  @override
  Widget build(BuildContext context) {

    final Map argume = ModalRoute.of(context).settings.arguments as Map;

    String data = "";

    if(argume!=null){
      print(argume['myData']);
      data = argume['myData'];
      print(data);
    }

    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Center(child: menu(data)),
      routes: {
        '/materia': (context) => materiaprimas(),
        '/producto': (context) => productosterminados(),
      },

    );
  }
}


class menu extends StatelessWidget{

  String argumemenu;
  menu(this.argumemenu){
    print(argumemenu);
  }

  @override
  Widget build(BuildContext context) {

        return Provider<Pro1Api>(
            create: (context)=>Pro1Api.create(),
            child: MaterialApp(
                theme: ThemeData(
                primaryColor: Colors.lightBlue
                ),
                home: ListaProductoNombre(argumemenu),
            ),

        );

        /*appBar: AppBar(
          title: Center(child: Text("productos"),),
        ),*/
        /*body: (
            MainProveedor()
        )*/
  }

}

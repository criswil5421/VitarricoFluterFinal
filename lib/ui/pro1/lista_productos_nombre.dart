
import 'package:calidad_servicioupeu/api/api_materiaprima.dart';
import 'package:calidad_servicioupeu/api/api_pro1.dart';
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListaProductoNombre extends StatelessWidget{

  String argumemenu;
  ListaProductoNombre(this.argumemenu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Producto"),),
      ),
      body: _listFutureProducto(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          /*
          print("hola boton");
          var token="Token";

            final prefs= await SharedPreferences.getInstance();


            final api=Provider.of<ProveedorApi>(context, listen: false);
            final usuario=new ModeloUsuario();
            usuario.nombreUsuario="admin";
            usuario.password="admin";


            api.login(usuario).then((value) {

              print("Probando"+value.nombreUsuario);
              token=value.bearer+" "+value.token;
              prefs.setString("token", token);
            }).catchError((onError){
              print(onError.toString());
            });*/

        },
        child: Icon(Icons.account_balance),
      ),
    );
  }

  FutureBuilder _listFutureProducto(BuildContext context){
    return FutureBuilder<List<ModeloPro1>>(
        future: Provider.of<Pro1Api>(context, listen: false).getProductoNombre(argumemenu),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloPro1>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Periodo")),
              );
            }
            final producto=snapshot.data;
            print(producto.length);
            //Implementar
            return _listProducto(context: context, producto: producto);
          }else{
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }

  ListView _listProducto({BuildContext context, List<ModeloPro1>producto  }){
    return ListView.builder(


        itemCount: producto.length,
        itemBuilder: (BuildContext context, int index){
          return Card(


            child: Container(



              padding: EdgeInsets.all(10.0),

              child: ListTile(

                leading: Text(producto[index].productoId.toString()),
                title: Text(producto[index].productoNombre),
                subtitle: Text(producto[index].productoDescripcion),
                  trailing: Text(producto[index].productoCantidad),



              ),


            ),
          );
        }
    );
  }



}
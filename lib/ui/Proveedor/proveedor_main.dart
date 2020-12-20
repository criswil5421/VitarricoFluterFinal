
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProveedorMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista proveedor"),),
      ),
      body: _listFutureProveedor(context),
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

  FutureBuilder _listFutureProveedor(BuildContext context){
    return FutureBuilder<List<ModeloProveedor>>(
        future: Provider.of<ProveedorApi>(context, listen: false).getProveedor(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloProveedor>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Periodo")),
              );
            }
            final proveedor=snapshot.data;
            print(proveedor.length);
            //Implementar
            return _listProveedor(context: context, proveedor: proveedor);
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

  ListView _listProveedor({BuildContext context, List<ModeloProveedor>proveedor  }){
    return ListView.builder(
        itemCount: proveedor.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(proveedor[index].proveedorId.toString()),
                title: Text(proveedor[index].proveedorNombre),


              ),  
            ),
          );
        }
    );
  }



}
import 'package:calidad_servicioupeu/api/api_pro1.dart';
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPro1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista producto1"),),
      ),
      body: _listFuturePro1(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<Pro1Api>(context, listen: false);
          final usuario=new ModeloUsuario();
          usuario.nombreUsuario="admin";
          usuario.password="admin";


          api.login(usuario).then((value) {

            print("Probando"+value.nombreUsuario);
            token=value.bearer+" "+value.token;
            prefs.setString("token", token);
          }).catchError((onError){
            print(onError.toString());
          });

        },
        child: Icon(Icons.account_balance),
      ),
    );
  }

  FutureBuilder _listFuturePro1(BuildContext context){
    return FutureBuilder<List<ModeloPro1>>(
        future: Provider.of<Pro1Api>(context, listen: false).getPro1(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloPro1>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar producto1")),
              );
            }
            final pro1=snapshot.data;
            print(pro1.length);
            //Implementar
            return _listPro1(context: context, pro1: pro1);
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

  ListView _listPro1({BuildContext context, List<ModeloPro1> pro1}){
    return ListView.builder(
        itemCount: pro1.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(pro1[index].idPro1.toString()),
                title: Text(pro1[index].producto_nombre),
                subtitle: new Text('Nombre: ${pro1[index].producto_precio}'),
              ),
            ),
          );
        }
    );
  }



}
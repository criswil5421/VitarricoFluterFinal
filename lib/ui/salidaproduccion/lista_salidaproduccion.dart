import 'package:calidad_servicioupeu/api/api_salida_produccion.dart';
import 'package:calidad_servicioupeu/modelo/salida_produccion_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalidaProduccionApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Salida de produccion"),),
      ),
      body: _listFutureSalidaProduccion(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<SalidaProduccionApi>(context, listen: false);
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

  FutureBuilder _listFutureSalidaProduccion(BuildContext context){
    return FutureBuilder<List<ModeloSalidaProduccion>>(
        future: Provider.of<SalidaProduccionApi>(context, listen: false).getSalidaProduccion(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloSalidaProduccion>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar salida de produccion")),
              );
            }
            final salidaproduccion=snapshot.data;
            print(salidaproduccion.length);
            //Implementar
            return _listSalidaProduccion(context: context, salidaproduccion: salidaproduccion);
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

  ListView _listSalidaProduccion({BuildContext context, List<ModeloSalidaProduccion> salidaproduccion}){
    return ListView.builder(
        itemCount: salidaproduccion.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(salidaproduccion[index].salproId.toString()),
                title: Text(salidaproduccion[index].salproFecha),
              ),
            ),
          );
        }
    );
  }



}
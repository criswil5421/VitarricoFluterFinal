import 'package:calidad_servicioupeu/api/api_tienda.dart';
import 'package:calidad_servicioupeu/modelo/tienda_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaTienda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista tienda"),),
      ),
      body: _listFutureTienda(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();

          final api=Provider.of<TiendaApi>(context, listen: false);
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

  FutureBuilder _listFutureTienda(BuildContext context){
    return FutureBuilder<List<ModeloTienda>>(
        future: Provider.of<TiendaApi>(context, listen: false).getTienda(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloTienda>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Tienda")),
              );
            }
            final tienda=snapshot.data;
            print(tienda.length);
            //Implementar
            return _listTienda(context: context, tienda: tienda);
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

  ListView _listTienda({BuildContext context, List<ModeloTienda> tienda}){
    return ListView.builder(
        itemCount: tienda.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(tienda[index].tiendaId.toString()),
                title: Text(tienda[index].tiendaNombre),
                subtitle: new Text('Nombre: ${tienda[index].tiendaNombre}'),

                onTap: (){
                  print(tienda[index].tiendaNombre);
                },
              ),
            ),
          );
        }
    );
  }



}
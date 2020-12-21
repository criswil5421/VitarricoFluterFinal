
import 'package:calidad_servicioupeu/api/api_materiaprima.dart';
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/modelo/materiaprima_model.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListaMateriaPrimaNombre extends StatelessWidget{

  String argumemenu;
  ListaMateriaPrimaNombre(this.argumemenu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista proveedor"),),
      ),
      body: _listFutureMateria(context),
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

  FutureBuilder _listFutureMateria(BuildContext context){
    return FutureBuilder<List<ModeloMateriaPrima>>(
        future: Provider.of<MateriaprimaApi>(context, listen: false).getMateriaNombre(argumemenu),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloMateriaPrima>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Periodo")),
              );
            }
            final materia=snapshot.data;
            print(materia.length);
            //Implementar
            return _listMateria(context: context, materia: materia);
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

  ListView _listMateria({BuildContext context, List<ModeloMateriaPrima>materia  }){
    return ListView.builder(
        itemCount: materia.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(

                leading: Text(materia[index].materiaId.toString()),
                title: Text(materia[index].materiaNombre),
                subtitle: Text(materia[index].materiaIngreso),
                trailing: Text(materia[index].materiaCantidad),

              ),
            ),
          );
        }
    );
  }



}
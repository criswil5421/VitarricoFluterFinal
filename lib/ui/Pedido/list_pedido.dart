import 'package:calidad_servicioupeu/api/api_pedido.dart';
import 'package:calidad_servicioupeu/modelo/pedido_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaPedido extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista Pedido"),),
      ),
      body: _listFuturePedido(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var token="Token";

          final prefs= await SharedPreferences.getInstance();


          final api=Provider.of<PedidoApi>(context, listen: false);
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

  FutureBuilder _listFuturePedido(BuildContext context){
    return FutureBuilder<List<ModeloPedido>>(
        future: Provider.of<PedidoApi>(context, listen: false).getPedido(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloPedido>>  snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Error al Recuperar Pedido")),
              );
            }
            final pedido=snapshot.data;
            print(pedido.length);
            //Implementar
            return _listPedido(context: context, pedido: pedido);
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

  ListView _listPedido({BuildContext context, List<ModeloPedido> pedido}){
    return ListView.builder(
        itemCount: pedido.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(pedido[index].pedidoId.toString()),
                title: Text((pedido[index].pedidoFecha)),

                onTap: (){
                  print(pedido[index].pedidoFecha);
                },
              ),
            ),
          );
        }
    );
  }



}
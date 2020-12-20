


import 'package:calidad_servicioupeu/api/api_pedido.dart';
import 'package:calidad_servicioupeu/ui/Pedido/list_pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPedido extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<PedidoApi>(
      create: (context)=>PedidoApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaPedido(),
      ),

    );
  }

}
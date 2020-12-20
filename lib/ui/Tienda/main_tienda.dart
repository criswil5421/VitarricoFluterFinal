


import 'package:calidad_servicioupeu/api/api_tienda.dart';
import 'package:calidad_servicioupeu/ui/tienda/lista_tienda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTienda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<TiendaApi>(
      create: (context)=>TiendaApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaTienda(),
      ),

    );
  }

}
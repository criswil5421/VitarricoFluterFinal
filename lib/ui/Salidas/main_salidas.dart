


import 'package:calidad_servicioupeu/api/api_salidas.dart';
import 'package:calidad_servicioupeu/ui/Salidas/lista_salidas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainSalidas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<SalidasApi>(
      create: (context)=>SalidasApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaSalidas(),
      ),

    );
  }

}
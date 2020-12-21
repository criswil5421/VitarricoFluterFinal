
import 'package:calidad_servicioupeu/api/api_salida_produccion.dart';
import 'package:calidad_servicioupeu/ui/salidaproduccion/lista_salidaproduccion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalidaProduccionMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<SalidaProduccionApi>(
      create: (context)=>SalidaProduccionApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: SalidaProduccionApp(),
      ),

    );
  }

}



import 'package:calidad_servicioupeu/api/api_pro1.dart';
import 'package:calidad_servicioupeu/ui/pro1/list_pro1.dart';
import 'package:calidad_servicioupeu/ui/pro1/list_pro1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPro1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<Pro1Api>(
      create: (context)=>Pro1Api.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ListaPro1(),
      ),

    );
  }

}
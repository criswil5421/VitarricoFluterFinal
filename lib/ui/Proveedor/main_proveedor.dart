
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/ui/Proveedor/proveedor_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProveedor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<ProveedorApi>(
      create: (context)=>ProveedorApi.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.lightBlue
        ),
        home: ProveedorMain(),
      ),

    );
  }

}

import 'dart:async';
import 'package:calidad_servicioupeu/api/api_pro1.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:dio/dio.dart';

class Pro1Repository{
  Pro1Api pro1api;

  PeriodoRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    pro1api=Pro1Api(_dio);
  }

  Future<List<ModeloPro1>> getPro1() async{
    return await pro1api.getPro1();
  }

  Future<ModeloMensaje> deletePro1(int idPro1) async{
    return await pro1api.deletePro1(idPro1);
  }
  Future<List<ModeloPro1>> getProductoNombre(String productoNombre) async{
    return await pro1api.getProductoNombre(productoNombre);
  }

  Future<ModeloMensaje> updatePro1(int idPeriodo, ModeloPro1 pro1) async{
    return await pro1api.updatePro1(idPeriodo, pro1);
  }


  Future<ModeloMensaje> createPro1(ModeloPro1 pro1) async{
    return await pro1api.createPro1(pro1);
  }

}
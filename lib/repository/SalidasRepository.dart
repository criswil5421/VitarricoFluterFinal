
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_salidas.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/salidas_modelo.dart';
import 'package:dio/dio.dart';

class SalidasRepository{
  SalidasApi salidasapi;

  SalidasRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    salidasapi=SalidasApi(_dio);
  }

  Future<List<ModeloSalidas>> getSalidas() async{
    return await salidasapi.getSalidas();
  }

  Future<ModeloMensaje> deleteSalidas(int idSalidas) async{
    return await salidasapi.deleteSalidas(idSalidas);
  }

  Future<ModeloMensaje> updateSalidas(int idSalidas, ModeloSalidas salidas) async{
    return await salidasapi.updateSalidas(idSalidas, salidas);
  }


  Future<ModeloMensaje> createSalidas(ModeloSalidas salidas) async{
    return await salidasapi.createSalidas(salidas);
  }

}
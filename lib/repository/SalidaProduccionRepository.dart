
import 'dart:async';
import 'package:calidad_servicioupeu/api/api_salida_produccion.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/salida_produccion_modelo.dart';
import 'package:dio/dio.dart';

class SalidaProduccionRepository{
  SalidaProduccionApi salidaproduccionapi;

  SalidaProduccionRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    salidaproduccionapi=SalidaProduccionApi(_dio);
  }

  Future<List<ModeloSalidaProduccion>> getSalidaProduccion() async{
    return await salidaproduccionapi.getSalidaProduccion();
  }

  Future<ModeloMensaje> deleteSalidaProduccion(int salpro_id) async{
    return await salidaproduccionapi.deleteSalidaProduccion(salpro_id);
  }

  Future<ModeloMensaje> updateSalidaProduccion(int salpro_id, ModeloSalidaProduccion salidaproduccion) async{
    return await salidaproduccionapi.updateSalidaProduccion(salpro_id, salidaproduccion);
  }


  Future<ModeloMensaje> createSalidaProduccion(ModeloSalidaProduccion salidaproduccion) async{
    return await salidaproduccionapi.createSalidaProduccion(salidaproduccion);
  }

}
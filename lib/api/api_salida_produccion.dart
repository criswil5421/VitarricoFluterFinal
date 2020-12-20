import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/periodo_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/salida_produccion_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_salida_produccion.g.dart';

@RestApi(baseUrl: "http://60.60.60.36:8080")
abstract class SalidaProduccionApi{
  factory SalidaProduccionApi(Dio dio, {String baseUrl})=_SalidaProduccionApi;

  static SalidaProduccionApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return SalidaProduccionApi(dio);
  }

  @GET("/salidaproduccion/lista2")
  Future<List<ModeloSalidaProduccion>> getSalidaProduccion();

  @GET("/salidaproduccion/lista2")
  Future<List<ModeloSalidaProduccion>> getSalidaProduccion2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/salidaproduccion/detail/{id}")
  Future<ModeloSalidaProduccion> getSalidaProduccionId(@Path("id") String id);

  @DELETE("/salidaproduccion/delete/{id}")
  Future<ModeloMensaje> deleteSalidaProduccion(@Path("id") int id);

  @PUT("/salidaproduccion/update/{id}")
  Future<ModeloMensaje> updateSalidaProduccion(@Path("id") int id, @Body() ModeloSalidaProduccion salidaproduccion);

  @POST("/salidaproduccion/create")
  Future<ModeloMensaje> createSalidaProduccion(@Body() ModeloSalidaProduccion salidaproduccion);

}



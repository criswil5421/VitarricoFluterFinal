
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/salidas_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_salidas.g.dart';

@RestApi(baseUrl: "http://192.168.100.4:8080")
abstract class SalidasApi{
  factory SalidasApi(Dio dio, {String baseUrl})=_ApiSalidas;

  static SalidasApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return SalidasApi(dio);
  }

  @GET("/salida/lista2")
  Future<List<ModeloSalidas>> getSalidas();

  @GET("/salida/lista2")
  Future<List<ModeloSalidas>> getSalidas2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/salida/detail/{id}")
  Future<ModeloSalidas> getSalidasId(@Path("id") String id);

  @DELETE("/salida/delete/{id}")
  Future<ModeloMensaje> deleteSalidas(@Path("id") int id);

  @PUT("/salida/update/{id}")
  Future<ModeloMensaje> updateSalidas(@Path("id") int id, @Body() ModeloSalidas salidas);

  @POST("/salida/create")
  Future<ModeloMensaje> createSalidas(@Body() ModeloSalidas salidas);

}


import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_pro1.g.dart';

@RestApi(baseUrl: "http://60.60.60.36:8080")
abstract class Pro1Api{
  factory Pro1Api(Dio dio, {String baseUrl})=_Pro1Api;

  static Pro1Api create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return Pro1Api(dio);
  }

  @GET("/pro1/lista2")
  Future<List<ModeloPro1>> getPro1();

  @GET("/pro1/lista2")
  Future<List<ModeloPro1>> getPro12(@Header("Authorization") String token);

  @GET("/pro1/detailname/{nombre}")
  Future<List<ModeloPro1>> getProductoNombre(@Path("nombre") String productoNombre);


  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/pro1/detail/{id}")
  Future<ModeloPro1> getPro1Id(@Path("id") String id);

  @DELETE("/pro1/delete/{id}")
  Future<ModeloMensaje> deletePro1(@Path("id") int id);

  @PUT("/pro1/update/{id}")
  Future<ModeloMensaje> updatePro1(@Path("id") int id, @Body() ModeloPro1 pro1);

  @POST("/pro1/create")
  Future<ModeloMensaje> createPro1(@Body() ModeloPro1 pro1);

}



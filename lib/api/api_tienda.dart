import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/tienda_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_tienda.g.dart';

@RestApi(baseUrl: "http://192.168.2.234:8080")
abstract class TiendaApi{
  factory TiendaApi(Dio dio, {String baseUrl})=_TiendaApi;

  static TiendaApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return TiendaApi(dio);
  }

  @GET("/tienda/lista2")
  Future<List<ModeloTienda>> getTienda();

  @GET("/tienda/lista2")
  Future<List<ModeloTienda>> getTienda2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/tienda/detail/{id}")
  Future<ModeloTienda> getTiendaId(@Path("id") String id);

  @DELETE("/tienda/delete/{id}")
  Future<ModeloMensaje> deleteTienda(@Path("id") int id);

  @PUT("/tienda/update/{id}")
  Future<ModeloMensaje> updateTienda(@Path("id") int id, @Body() ModeloTienda tienda);

  @POST("/tienda/create")
  Future<ModeloMensaje> createTienda(@Body() ModeloTienda tienda);

}



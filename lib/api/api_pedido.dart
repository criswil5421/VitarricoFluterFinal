import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/pedido_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_pedido.g.dart';

@RestApi(baseUrl: "http://60.60.60.36:8080")
abstract class PedidoApi{
  factory PedidoApi(Dio dio, {String baseUrl})=_PedidoApi;

  static PedidoApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return PedidoApi(dio);
  }

  @GET("/pedido/lista2")
  Future<List<ModeloPedido>> getPedido();

  @GET("/pedido/lista2")
  Future<List<ModeloPedido>> getPedido2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/pedido/detail/{id}")
  Future<ModeloPedido> getPedidoId(@Path("id") String id);

  @DELETE("/pedido/delete/{id}")
  Future<ModeloMensaje> deletePedido(@Path("id") int id);

  @PUT("/pedido/update/{id}")
  Future<ModeloMensaje> updatePedido(@Path("id") int id, @Body() ModeloPedido pedido);

  @POST("/pedido/create")
  Future<ModeloMensaje> createPedido(@Body() ModeloPedido pedido);

}




import 'dart:async';
import 'package:calidad_servicioupeu/api/api_pedido.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/pedido_modelo.dart';
import 'package:dio/dio.dart';

class PedidoRepository{
  PedidoApi pedidoapi;

  PedidoRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    pedidoapi=PedidoApi(_dio);
  }

  Future<List<ModeloPedido>> getPedido() async{
    return await pedidoapi.getPedido();
  }

  Future<ModeloMensaje> deletePedido(int idPedido) async{
    return await pedidoapi.deletePedido(idPedido);
  }

  Future<ModeloMensaje> updatePedido(int idPedido, ModeloPedido pedido) async{
    return await pedidoapi.updatePedido(idPedido, pedido);
  }

  Future<ModeloMensaje> createPedido(ModeloPedido pedido) async{
    return await pedidoapi.createPedido(pedido);
  }

}
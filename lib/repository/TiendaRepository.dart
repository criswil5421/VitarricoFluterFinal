import 'dart:async';
import 'package:calidad_servicioupeu/api/api_tienda.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/tienda_modelo.dart';
import 'package:dio/dio.dart';

class TiendaRepository{
  TiendaApi tiendaapi;

  TiendaRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    tiendaapi=TiendaApi(_dio);
  }

  Future<List<ModeloTienda>> getTienda() async{
    return await tiendaapi.getTienda();
  }

  Future<ModeloMensaje> deleteTienda(int idTienda) async{
    return await tiendaapi.deleteTienda(idTienda);
  }

  Future<ModeloMensaje> updateTienda(int idTienda, ModeloTienda tienda) async{
    return await tiendaapi.updateTienda(idTienda, tienda);
  }


  Future<ModeloMensaje> createTienda(ModeloTienda tienda) async{
    return await tiendaapi.createTienda(tienda);
  }

}
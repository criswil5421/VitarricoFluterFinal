import 'dart:async';
import 'package:calidad_servicioupeu/api/api_proveedor.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';
import 'package:dio/dio.dart';

class ProveedorRepository{
  ProveedorApi proveedorApi;

  ProveedorRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    proveedorApi=ProveedorApi(_dio);
  }

  Future<List<ModeloProveedor>> getProveedor() async{
    return await proveedorApi.getProveedor();
  }

  Future<List<ModeloProveedor>> getProveedorNombre(String proveedorNombre) async{
    return await proveedorApi.getProveedorNombre(proveedorNombre);
  }

  Future<ModeloMensaje> deleteProveedor(int idProveedor) async{
    return await proveedorApi.deleteProveedor(idProveedor);
  }

  Future<ModeloMensaje> updateProveedor(int idProveedor, ModeloProveedor proveedor) async{
    return await proveedorApi.updateProveedor(idProveedor, proveedor);
  }

  Future<ModeloMensaje> createProveedor(ModeloProveedor proveedor) async{
    return await proveedorApi.createProveedor(proveedor);
  }



}
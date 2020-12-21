import 'package:calidad_servicioupeu/modelo/almacen_modelo.dart';

class ModeloPro1{
  int productoId;
  String productoNombre;
  double productoPrecio;
  String productoIngreso ;
  String productoCantidad;
  String productoDescripcion;
  ModeloAlmacen almacenId;

  ModeloPro1({this.productoId,
    this.productoNombre,
    this.productoPrecio,
    this.productoIngreso,
    this.productoCantidad,
    this.productoDescripcion,
    this.almacenId});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();

    data['almacenId']=this.almacenId.toJson();
    data['productoId']=this.productoId;
    data['productoNombre']=this.productoNombre;
    data['productoPrecio']=this.productoPrecio;
    data['productoIngreso']=this.productoIngreso;
    data['productoCantidad']=this.productoCantidad;
    data['productoDescripcion']=this.productoDescripcion;
    return data;
  }

  ModeloPro1.fromJson(Map<String, dynamic> json){

    almacenId=ModeloAlmacen.fromJson(json['almacenId']);
    productoId=json['productoId'];
    productoNombre=json['productoNombre'];
    productoPrecio=json['productoPrecio'];
    productoIngreso=json['productoIngreso'];
    productoCantidad=json['productoCantidad'];
    productoDescripcion=json['productoDescripcion'];
  }

}
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';

class ModeloSalidaProduccion{
  int salproId  ;
  String salproFecha;
  ModeloPro1 productoId;

  ModeloSalidaProduccion({
    this.salproId,
    this.salproFecha,
    this.productoId,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();

    data['productoId']=this.productoId.toJson();
    data['salproId']=this.salproId;
    data['salproFecha']=this.salproFecha;
    return data;
  }

  ModeloSalidaProduccion.fromJson(Map<String, dynamic> json){

    productoId=ModeloPro1.fromJson(json['productoId']);
    salproId=json['salproId'];
    salproFecha=json['salproFecha'];
  }

}
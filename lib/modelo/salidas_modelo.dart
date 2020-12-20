
class ModeloSalidas{

  int salidaId ;
  String  salidaFecha ;
  int tiendaId ;


  ModeloSalidas({
    this.salidaId,
    this.salidaFecha,
    this.tiendaId});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
    data['salidaId']=this.salidaId;
    data['salidaFecha']=this.salidaFecha;
    data['tiendaId']=this.tiendaId;
    return data;
  }

  ModeloSalidas.fromJson(Map<String, dynamic> json){
    salidaId=json['salidaId'];
    salidaFecha=json['salidaFecha'];
    tiendaId=json['tiendaId'];
  }

}
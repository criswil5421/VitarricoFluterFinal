// TODO Implement this library.// TODO Implement this library.
class ModeloSalidaProduccion{
  int salpro_id  ;
  String salpro_fecha;
  int producto_id;

  ModeloSalidaProduccion({
    this.salpro_id,
    this.salpro_fecha,
    this.producto_id,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['salpro_id']=this.salpro_id;
    data['salpro_fecha']=this.salpro_fecha;
    data['producto_id']=this.producto_id;
    return data;
  }

  ModeloSalidaProduccion.fromJson(Map<String, dynamic> json){
    salpro_id=json['salpro_id'];
    salpro_fecha=json['salpro_fecha'];
    producto_id=json['producto_id'];
  }

}
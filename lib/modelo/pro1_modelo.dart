
class ModeloPro1{

  int idPro1;
  String producto_cantidad;
  String producto_descripcion;
  String producto_ingreso ;
  String producto_nombre;
  double producto_precio;
  int almacen_id;

  ModeloPro1({this.idPro1, this.producto_cantidad, this.producto_descripcion, this.producto_ingreso, this.producto_nombre, this.producto_precio, this.almacen_id});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
    data['idPro1']=this.idPro1;
    data['producto_cantidad']=this.producto_cantidad;
    data['producto_descripcion']=this.producto_descripcion;
    data['producto_ingreso']=this.producto_ingreso;
    data['producto_nombre']=this.producto_nombre;
    data['producto_precio']=this.producto_precio;
    data['almacen_id']=this.almacen_id;
    return data;
  }

  ModeloPro1.fromJson(Map<String, dynamic> json){
    idPro1=json['idPro1'];
    producto_cantidad=json['producto_cantidad'];
    producto_descripcion=json['producto_descripcion'];
    producto_ingreso=json['producto_ingreso'];
    producto_nombre=json['producto_nombre'];
    producto_precio=json['producto_precio'];
    almacen_id=json['almacen_id'];
  }

}
class ModeloProductos{
  int productoId;
  String productoNombre;
  double productoPrecio;
  String productoIngreso;
  String productoCantidad;
  String productoDescripcion;
  int almacenId;


  ModeloProductos({
    this.productoId,
    this.productoNombre,
    this.productoPrecio,
    this.productoIngreso,
    this.productoCantidad,
    this.productoDescripcion,
    this.almacenId
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['productoId']=this.productoId;
    data['productoNombre']=this.productoNombre;
    data['productoPrecio']=this.productoPrecio;
    data['productoIngreso']=this.productoIngreso;
    data['productoCantidad']=this.productoCantidad;
    data['productoDescripcion']=this.productoDescripcion;
    data['almacenId']=this.almacenId;
    return data;
  }

  ModeloProductos.fromJson(Map<String, dynamic> json){
    productoId=json['productoId'];
    productoNombre=json['productoNombre'];
    productoPrecio=json['productoPrecio'];
    productoIngreso=json['productoIngreso'];
    productoCantidad=json['productoCantidad'];
    productoDescripcion=json['productoDescripcion'];
    almacenId=json['almacenId'];
  }

}
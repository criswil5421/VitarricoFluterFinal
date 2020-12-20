class ModeloPedido{

  int pedidoId;
  String pedidoFecha  ;
  int proveedorId;

  ModeloPedido({
    this.pedidoId,
    this.pedidoFecha,
    this.proveedorId});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
    data['pedidoId']=this.pedidoId;
    data['pedidoFecha']=this.pedidoFecha;
    data['proveedorId']=this.proveedorId;
    return data;
  }

  ModeloPedido.fromJson(Map<String, dynamic> json){
    pedidoId=json['pedidoId'];
    pedidoFecha=json['pedidoFecha'];
    proveedorId=json['proveedorId'];
  }

}
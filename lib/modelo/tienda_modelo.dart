
class ModeloTienda{

  int tiendaId;
  String tiendaNombre ;
  String tiendaDireccion;
  String tiendaTelefono;

  ModeloTienda({this.tiendaId, this.tiendaNombre, this.tiendaDireccion, this.tiendaTelefono});

  Map<String, dynamic> toJson(){
    final  Map<String, dynamic> data= new Map<String, dynamic>();
    data['tiendaId']=this.tiendaId;
    data['tiendaNombre']=this.tiendaNombre;
    data['tiendaDireccion']=this.tiendaDireccion;
    data['tiendaTelefono']=this.tiendaTelefono;
    return data;
  }

  ModeloTienda.fromJson(Map<String, dynamic> json){
    tiendaId=json['tiendaId'];
    tiendaNombre=json['tiendaNombre'];
    tiendaDireccion=json['tiendaDireccion'];
    tiendaTelefono=json['tiendaTelefono'];
  }

}
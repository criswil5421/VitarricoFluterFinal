

part of 'tienda_bloc.dart';


abstract class TiendaEvent{
  final ModeloTienda tienda;
  const TiendaEvent({this.tienda});
}

class ListarTiendaEvent extends TiendaEvent{ ListarTiendaEvent(); }

class DeleteTiendaEvent extends TiendaEvent{
  DeleteTiendaEvent({@required ModeloTienda tienda}):super(tienda:tienda);
}

class UpdateTiendaEvent extends TiendaEvent{
  UpdateTiendaEvent({@required ModeloTienda tienda}):super(tienda:tienda);
}

class CreateTiendaEvent extends TiendaEvent{
  CreateTiendaEvent({@required ModeloTienda tienda}):super(tienda:tienda);
}
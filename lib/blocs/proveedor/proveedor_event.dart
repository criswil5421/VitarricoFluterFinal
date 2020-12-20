

part of 'proveedor_bloc.dart';

abstract class ProveedorEvent{
  final ModeloProveedor proveedor;
  const ProveedorEvent({this.proveedor});
}

class ListarProveedorEvent extends ProveedorEvent{ ListarProveedorEvent(); }

class DeleteProveedorEvent extends ProveedorEvent{
  DeleteProveedorEvent({@required ModeloProveedor proveedor}):super(proveedor:proveedor);
}

class UpdateProveedorEvent extends ProveedorEvent{
  UpdateProveedorEvent({@required ModeloProveedor proveedor}):super(proveedor:proveedor);
}

class CreateProveedorEvent extends ProveedorEvent{
  CreateProveedorEvent({@required ModeloProveedor proveedor}):super(proveedor:proveedor);
}
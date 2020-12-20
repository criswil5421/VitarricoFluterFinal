
part of 'proveedor_bloc.dart';

class ProveedorState{ }

class ProveedorInitialState extends ProveedorState{ }

class ProveedorLoadingState extends ProveedorState{}

class ProveedorLoadedState extends ProveedorState{
  List<ModeloProveedor> proveedorList;
  ProveedorLoadedState(this.proveedorList);
}

class ProveedorError extends ProveedorState{
  Error e;
  ProveedorError(this.e);
}
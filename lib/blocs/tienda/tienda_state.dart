


part of 'tienda_bloc.dart';

class TiendaState{ }

class TiendaInitialState extends TiendaState{ }

class TiendaLoadingState extends TiendaState{}

class TiendaLoadedState extends TiendaState{
  List<ModeloTienda> tiendaList;
  TiendaLoadedState(this.tiendaList);
}

class TiendaError extends TiendaState{
  Error e;
  TiendaError(this.e);
}
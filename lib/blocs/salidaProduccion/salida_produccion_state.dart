
part of 'salida_produccion_bloc.dart';

class SalidaProduccionState{ }

class SalidaProduccionInitialState extends SalidaProduccionState{ }

class SalidaProduccionLoadingState extends SalidaProduccionState{}

class SalidaProduccionLoadedState extends SalidaProduccionState{
  List<ModeloSalidaProduccion> salidaproduccionList;
  SalidaProduccionLoadedState(this.salidaproduccionList);
}

class SalidaProduccionError extends SalidaProduccionState{
  Error e;
  SalidaProduccionError(this.e);
}

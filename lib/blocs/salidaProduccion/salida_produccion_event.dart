

part of 'salida_produccion_bloc.dart';


abstract class SalidaProduccionEvent{
  final ModeloSalidaProduccion salidaproduccion;
  const SalidaProduccionEvent({this.salidaproduccion});
}

class ListarSalidaProduccionEvent extends SalidaProduccionEvent{ ListarSalidaProduccionEvent(); }

class DeleteSalidaProduccionEvent extends SalidaProduccionEvent{  
  DeleteSalidaProduccionEvent({@required ModeloSalidaProduccion salidaproduccion}):super(salidaproduccion:salidaproduccion);
}

class UpdateSalidaProduccionEvent extends SalidaProduccionEvent{
  UpdateSalidaProduccionEvent({@required ModeloSalidaProduccion salidaproduccion}):super(salidaproduccion:salidaproduccion);
}

class CreateSalidaProduccionEvent extends SalidaProduccionEvent{
  CreateSalidaProduccionEvent({@required ModeloSalidaProduccion salidaproduccion}):super(salidaproduccion:salidaproduccion);
}
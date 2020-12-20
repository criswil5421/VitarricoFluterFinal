

part of 'salidas_bloc.dart';

abstract class SalidasEvent{
  final ModeloSalidas salidas;
  const SalidasEvent({this.salidas});
}

class ListarSalidasEvent extends SalidasEvent{ ListarSalidasEvent(); }

class DeleteSalidasEvent extends SalidasEvent{
  DeleteSalidasEvent({@required ModeloSalidas salidas}):super(salidas:salidas);
}

class UpdateSalidasEvent extends SalidasEvent{
  UpdateSalidasEvent({@required ModeloSalidas salidas}):super(salidas:salidas);
}

class CreateSalidasEvent extends SalidasEvent{
  CreateSalidasEvent({@required ModeloSalidas salidas}):super(salidas:salidas);
}
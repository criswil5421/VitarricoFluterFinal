
part of 'salidas_bloc.dart';

class SalidasState{ }

class SalidasInitialState extends SalidasState{ }

class SalidasLoadingState extends SalidasState{}

class SalidasLoadedState extends SalidasState{
  List<ModeloSalidas> salidasList;
  SalidasLoadedState(this.salidasList);
}

class SalidasError extends SalidasState{
  Error e;
  SalidasError(this.e);
}
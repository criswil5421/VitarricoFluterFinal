


part of 'pro1_bloc.dart';

class Pro1State{ }

class Pro1InitialState extends Pro1State{ }

class Pro1LoadingState extends Pro1State{}

class Pro1LoadedState extends Pro1State{
  List<ModeloPro1> pro1List;
  Pro1LoadedState(this.pro1List);
}

class Pro1Error extends Pro1State{
  Error e;
  Pro1Error(this.e);
}
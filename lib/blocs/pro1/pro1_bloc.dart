
import 'dart:async';

import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:calidad_servicioupeu/repository/Pro1Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pro1_event.dart';
part 'pro1_state.dart';

class Pro1Bloc extends Bloc<Pro1Event, Pro1State> {

  final Pro1Repository _pro1Repository;

  Pro1Bloc({Pro1Repository pro1Repository})
      :
        _pro1Repository=pro1Repository,
        super(Pro1InitialState());



  @override
  Stream<Pro1State> mapEventToState(Pro1Event event) async* {
    if (event is ListarPro1Event) {
      yield Pro1LoadingState();
      try {
        List<ModeloPro1> pro1List = await _pro1Repository.getPro1();
        yield Pro1LoadedState(pro1List);
      } catch (e) {
        print("Error ${e.toString()}");
        yield Pro1Error(e);
      }



    } else if (event is DeletePro1Event) {
      try {
        await _pro1Repository.deletePro1(event.pro1.productoId);
        yield Pro1LoadingState();
        List<ModeloPro1> pro1List = await _pro1Repository.getPro1();
        yield Pro1LoadedState(pro1List);
      } catch (e) {
        print("Error ${e.toString()}");
        yield Pro1Error(e);
      }
    } else if (event is CreatePro1Event) {
      try {
        await _pro1Repository.createPro1(event.pro1);
        yield Pro1LoadingState();
        List<ModeloPro1> pro1List = await _pro1Repository.getPro1();
        yield Pro1LoadedState(pro1List);
      } catch (e) {
        print("Error ${e.toString()}");
        yield Pro1Error(e);
      }
    } else if (event is UpdatePro1Event) {
      try {
        await _pro1Repository.updatePro1(
            event.pro1.productoId, event.pro1);
        yield Pro1LoadingState();
        List<ModeloPro1> pro1List = await _pro1Repository.getPro1();
        yield Pro1LoadedState(pro1List);
      } catch (e) {
        print("Error ${e.toString()}");
        yield Pro1Error(e);
      }
    }
  }

}


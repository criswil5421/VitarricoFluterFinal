import 'dart:async';
import 'package:calidad_servicioupeu/modelo/salida_produccion_modelo.dart';
import 'package:calidad_servicioupeu/repository/SalidaProduccionRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salida_produccion_event.dart';
part 'salida_produccion_state.dart';

class SalidaProduccionBloc extends Bloc<SalidaProduccionEvent, SalidaProduccionState>{

  final SalidaProduccionRepository _salidaproduccionRepository;

  SalidaProduccionBloc({SalidaProduccionRepository salidaproduccionRepository}) :
        _salidaproduccionRepository=salidaproduccionRepository,
        super(SalidaProduccionInitialState());


  @override
  Stream<SalidaProduccionState> mapEventToState(SalidaProduccionEvent event) async* {
    if (event is ListarSalidaProduccionEvent) {
      yield SalidaProduccionLoadingState();
      try {
        List<ModeloSalidaProduccion> salidaproduccionList = await _salidaproduccionRepository.getSalidaProduccion();
        yield SalidaProduccionLoadedState(salidaproduccionList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SalidaProduccionError(e);
      }



    }else if(event is DeleteSalidaProduccionEvent){
      try{
        await _salidaproduccionRepository.deleteSalidaProduccion(event.salidaproduccion.salproId);
        yield SalidaProduccionLoadingState();
        List<ModeloSalidaProduccion> salidaproduccionList= await _salidaproduccionRepository.getSalidaProduccion();
        yield SalidaProduccionLoadedState(salidaproduccionList);
      }catch(e){
        print("Error ${e.toString()}");
        yield SalidaProduccionError(e);
      }
    }else if(event is CreateSalidaProduccionEvent){
      try{
        await _salidaproduccionRepository.createSalidaProduccion(event.salidaproduccion);
        yield SalidaProduccionLoadingState();
        List<ModeloSalidaProduccion> salidaproduccionList= await _salidaproduccionRepository.getSalidaProduccion();
        yield SalidaProduccionLoadedState(salidaproduccionList);
      }catch(e){
        print("Error ${e.toString()}");
        yield SalidaProduccionError(e);
      }
    }else if(event is UpdateSalidaProduccionEvent){
      try{
        await _salidaproduccionRepository.updateSalidaProduccion(event.salidaproduccion.salproId, event.salidaproduccion);
        yield SalidaProduccionLoadingState();
        List<ModeloSalidaProduccion> salidaproduccionList= await _salidaproduccionRepository.getSalidaProduccion();
        yield SalidaProduccionLoadedState(salidaproduccionList);
      }catch(e){
        print("Error ${e.toString()}");
        yield SalidaProduccionError(e);
      }
    }
  }

}
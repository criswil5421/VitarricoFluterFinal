import 'dart:async';
import 'package:calidad_servicioupeu/modelo/salidas_modelo.dart';
import 'package:calidad_servicioupeu/repository/SalidasRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salidas_event.dart';
part 'salidas_state.dart';

class SalidasBloc extends Bloc<SalidasEvent, SalidasState> {

  final SalidasRepository _salidasRepository;

  SalidasBloc({SalidasRepository salidasRepository})
      :
        _salidasRepository=salidasRepository,
        super(SalidasInitialState());



  @override
  Stream<SalidasState> mapEventToState(SalidasEvent event) async* {
    if (event is ListarSalidasEvent) {
      yield SalidasLoadingState();
      try {
        List<ModeloSalidas> salidasList = await _salidasRepository.getSalidas();
        yield SalidasLoadedState(salidasList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SalidasError(e);
      }



    } else if (event is DeleteSalidasEvent) {
      try {
        await _salidasRepository.deleteSalidas(event.salidas.salidaId);
        yield SalidasLoadingState();
        List<ModeloSalidas> salidasList = await _salidasRepository.getSalidas();
        yield SalidasLoadedState(salidasList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SalidasError(e);
      }
    } else if (event is CreateSalidasEvent) {
      try {
        await _salidasRepository.createSalidas(event.salidas);
        yield SalidasLoadingState();
        List<ModeloSalidas> salidasList = await _salidasRepository.getSalidas();
        yield SalidasLoadedState(salidasList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SalidasError(e);
      }
    } else if (event is UpdateSalidasEvent) {
      try {
        await _salidasRepository.updateSalidas(
            event.salidas.salidaId, event.salidas);
        yield SalidasLoadingState();
        List<ModeloSalidas> salidasList = await _salidasRepository.getSalidas();
        yield SalidasLoadedState(salidasList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SalidasError(e);
      }
    }
  }

}

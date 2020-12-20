import 'dart:async';
import 'package:calidad_servicioupeu/modelo/tienda_modelo.dart';
import 'package:calidad_servicioupeu/repository/TiendaRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tienda_event.dart';
part 'tienda_state.dart';

class TiendaBloc extends Bloc<TiendaEvent, TiendaState> {

  final TiendaRepository _tiendaRepository;

  TiendaBloc({TiendaRepository tiendaRepository})
      :
        _tiendaRepository=tiendaRepository,
        super(TiendaInitialState());



  @override
  Stream<TiendaState> mapEventToState(TiendaEvent event) async* {
    if (event is ListarTiendaEvent) {
      yield TiendaLoadingState();
      try {
        List<ModeloTienda> tiendaList = await _tiendaRepository.getTienda();
        yield TiendaLoadedState(tiendaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield TiendaError(e);
      }



    }else if (event is DeleteTiendaEvent) {
      try {
        await _tiendaRepository.deleteTienda(event.tienda.tiendaId);
        yield TiendaLoadingState();
        List<ModeloTienda> TiendaList = await _tiendaRepository.getTienda();
        yield TiendaLoadedState(TiendaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield TiendaError(e);
      }
    } else if (event is CreateTiendaEvent) {
      try {
        await _tiendaRepository.createTienda(event.tienda);
        yield TiendaLoadingState();
        List<ModeloTienda> tiendaList = await _tiendaRepository.getTienda();
        yield TiendaLoadedState(tiendaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield TiendaError(e);
      }
    } else if (event is UpdateTiendaEvent) {
      try {
        await _tiendaRepository.updateTienda(
            event.tienda.tiendaId, event.tienda);
        yield TiendaLoadingState();
        List<ModeloTienda> tiendaList = await _tiendaRepository.getTienda();
        yield TiendaLoadedState(tiendaList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield TiendaError(e);
      }
    }
  }

}


import 'dart:async';

import 'package:calidad_servicioupeu/modelo/pedido_modelo.dart';
import 'package:calidad_servicioupeu/repository/PedidoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pedido_event.dart';
part 'pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {

  final PedidoRepository _pedidoRepository;

  PedidoBloc({PedidoRepository pedidoRepository})
      :
        _pedidoRepository=pedidoRepository,
        super(PedidoInitialState());



  @override
  Stream<PedidoState> mapEventToState(PedidoEvent event) async* {
    if (event is ListarPedidoEvent) {
      yield PedidoLoadingState();
      try {
        List<ModeloPedido> pedidoList = await _pedidoRepository.getPedido();
        yield PedidoLoadedState(pedidoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PedidoError(e);
      }



    } else if (event is DeletePedidoEvent) {
      try {
        await _pedidoRepository.deletePedido(event.pedido.pedidoId);
        yield PedidoLoadingState();
        List<ModeloPedido> pedidoList = await _pedidoRepository.getPedido();
        yield PedidoLoadedState(pedidoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PedidoError(e);
      }
    } else if (event is CreatePedidoEvent) {
      try {
        await _pedidoRepository.createPedido(event.pedido);
        yield PedidoLoadingState();
        List<ModeloPedido> pedidoList = await _pedidoRepository.getPedido();
        yield PedidoLoadedState(pedidoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PedidoError(e);
      }
    } else if (event is UpdatePedidoEvent) {
      try {
        await _pedidoRepository.updatePedido(
            event.pedido.pedidoId, event.pedido);
        yield PedidoLoadingState();
        List<ModeloPedido> pedidoList = await _pedidoRepository.getPedido();
        yield PedidoLoadedState(pedidoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield PedidoError(e);
      }
    }
  }

}


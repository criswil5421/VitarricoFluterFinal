part of 'pedido_bloc.dart';

class PedidoState{ }

class PedidoInitialState extends PedidoState{ }

class PedidoLoadingState extends PedidoState{}

class PedidoLoadedState extends PedidoState{
  List<ModeloPedido> pedidoList;
  PedidoLoadedState(this.pedidoList);

}

class PedidoError extends PedidoState{
  Error e;
  PedidoError(this.e);
}
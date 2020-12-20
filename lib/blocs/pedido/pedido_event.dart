

part of 'pedido_bloc.dart';


abstract class PedidoEvent{
  final ModeloPedido pedido;
  const PedidoEvent({this.pedido});
}

class ListarPedidoEvent extends PedidoEvent{ ListarPedidoEvent(); }

class DeletePedidoEvent extends PedidoEvent{
  DeletePedidoEvent({@required ModeloPedido pedido}):super(pedido:pedido);
}

class UpdatePedidoEvent extends PedidoEvent{
  UpdatePedidoEvent({@required ModeloPedido pedido}):super(pedido:pedido);
}

class CreatePedidoEvent extends PedidoEvent{
  CreatePedidoEvent({@required ModeloPedido pedido}):super(pedido:pedido);
}
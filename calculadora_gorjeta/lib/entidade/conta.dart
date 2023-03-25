import 'package:contador_gorjeta/entidade/gorjeta.dart';
import 'package:contador_gorjeta/entidade/pedido.dart';

class Conta {
  final Gorjeta gorjeta;
  final Pedido pedido;

  Conta({required this.gorjeta, required this.pedido});
}

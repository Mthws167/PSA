import 'package:aula_16_02/entidade/produto.dart';

class Produto_Pedido {
  final Produto produto;
  final double quantidade;
  double descontoEmReais;

  Produto_Pedido(
      {required this.produto,
      required this.quantidade,
      this.descontoEmReais = 0.0});

  bool validarDescontoProdutoPedido() {
    double descontoPermitido = (this.produto.precoUnidade * quantidade) * 0.15;
    if (this.descontoEmReais > descontoPermitido) throw Exception("Desconto maior do que o permitido");
    return true;
  }

  double calcularDescontoProdutoPedido(Produto produto) {
    double valorComDesconto = 0.0;
    if(validarDescontoProdutoPedido()) valorComDesconto = (this.quantidade * this.produto.precoUnidade) - this.descontoEmReais;
    return valorComDesconto;
  }
}

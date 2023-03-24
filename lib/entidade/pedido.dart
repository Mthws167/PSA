import 'dart:ffi';

import 'package:aula_16_02/entidade/produto.dart';
import 'package:aula_16_02/entidade/produto_pedido.dart';
import 'package:aula_16_02/entidade/validar_cpf.dart';

class Pedido {
  double total = 0.0;
  List<Produto_Pedido> listaItemsPedido = [];

  Pedido({required String CPF}) {
    ValidadorCPF.comCPF(CPF);
  }

  double addItem(Produto_Pedido produto_pedido) {
    if(!existeProdutoAdicionado(produto_pedido.produto)){
      this.listaItemsPedido.add(produto_pedido);
    }
    total += produto_pedido.calcularDescontoProdutoPedido(produto_pedido.produto);
    return total;
  }

  int contarItem() {
    return this.listaItemsPedido.length;
  }

  bool existeProdutoAdicionado(Produto produto) {
    for (int contador = 0; contador < this.listaItemsPedido.length; contador++) {
      if(this.listaItemsPedido[contador].produto.nome == produto.nome){
        return true;
      }
    }
    return false; 
  }

  double getTotal() {
    return total;
  }

  double validarCupom(String cupomDesconto){
    var valorCupom = 0.0;
    if (cupomDesconto.substring(0, 5).toUpperCase() == "CUPOM") {
      valorCupom =
          double.parse(cupomDesconto.substring(5, cupomDesconto.length)) / 100;
    }

    return valorCupom;
  }

  double calcularCupom(String cupomDesconto) {
    var valorCupom = validarCupom(cupomDesconto);
    total = total - (total * valorCupom);
    return total;
  }

}
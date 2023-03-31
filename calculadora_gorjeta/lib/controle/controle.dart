import 'dart:ffi';

import 'package:contador_gorjeta/entidade/gorjeta.dart';

class ContaTotal {
  Cliente cliente = new Cliente();
  var gorjeta = cliente.gorjeta.valor;
   var avalicacao = cliente.avaliacao.estrelas;

  void gorjetaCalculo(gorjeta) {
    return gorjeta;
  }

  double gorjetaNegativa(gorjeta) {
    if(gorjeta < 0 ) gorjeta = 0.0;
    return gorjeta;
  }

  double gorjetaMinimaMaxima(gorjeta) {
    var valorConta = 10;
    var porcentagemGorjeta = (gorjeta * 100) / valorConta;

    gorjeta = porcentagemGorjeta;

    if (porcentagemGorjeta < 5.0 || porcentagemGorjeta > 30.0) gorjeta = 0.0;

    return gorjeta;
  }

  // Avaliação
  
  
  void avaliacaoExiste(cliente.avaliacao.estrelas) {
    return avalicacao;
  }
}

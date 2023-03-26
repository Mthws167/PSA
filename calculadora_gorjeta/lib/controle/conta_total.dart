import 'dart:ffi';

import 'package:contador_gorjeta/entidade/gorjeta.dart';

class ContaTotal {
  Gorjeta gorjeta = new Gorjeta();

  void gorjetaCalculo(gorjeta) {
    return gorjeta;
  }

  double gorjetaNegativa(gorjeta) {
    if(gorjeta < 0 ) gorjeta = 0.0;
    return gorjeta;
  }

  double gorjetaMinima(gorjeta) {
    var valorConta = 10;
    var porcentagemGorjeta = (gorjeta * 100) / valorConta;

    gorjeta = porcentagemGorjeta;

    if (porcentagemGorjeta < 5.0 || porcentagemGorjeta > 30.0) gorjeta = 0.0;

    return gorjeta;
  }
}

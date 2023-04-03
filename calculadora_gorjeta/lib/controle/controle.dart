import 'package:flutter/material.dart';

import '../entidade/cliente.dart';

class Controle {

  void gorjetaExiste(gorjeta) {
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

    if (porcentagemGorjeta < 5.0 ) gorjeta = 0.0;

    return gorjeta;
  }

  double gorjetaMaxima(gorjeta) {
    var valorConta = 10;
    var porcentagemGorjeta = (gorjeta * 100) / valorConta;

    gorjeta = porcentagemGorjeta;

    if (porcentagemGorjeta > 30.0) gorjeta = 30.0;

    return gorjeta;
  }

  double gorjetaAtendente(gorjeta, salarioAtendente){
    if(gorjeta!=null){
      salarioAtendente += gorjeta;
    }
    return salarioAtendente;
  }

  // Avaliação
  
  
  void avaliacaoExiste(avaliacao) {
    return avaliacao;
  }

  int avaliacaoMinima(avaliacao){
    if (avaliacao < 0 ) avaliacao = 0;

    return avaliacao;
  }

  int avaliacaoMaxima(avaliacao){
    if (avaliacao > 5) avaliacao = 5;

    return avaliacao;
  }

  bool gorjetaAvaliacaoAtendente(avaliacaoAtendente, gorjetaAtendente) {
    if(avaliacaoAtendente == gorjetaAtendente){
      return true;
    }
    return false;
  }
}

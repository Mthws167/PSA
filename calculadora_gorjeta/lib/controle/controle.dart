import 'package:contador_gorjeta/entidade/atendente_fixo.dart';
import 'package:contador_gorjeta/entidade/atendente_temporario.dart';
import 'package:flutter/material.dart';

import '../entidade/atendente.dart';
import '../entidade/avaliacao.dart';
import '../entidade/cliente.dart';
import '../entidade/gorjeta.dart';

class Controle {
  // Gorjeta
  bool gorjetaExiste(Gorjeta gorjeta) {
    if (gorjeta.valor > 0 && gorjeta.valor != null) {
      return true;
    }
    return false;
  }

  double gorjetaAtendente(double gorjeta, double salarioAtendente) {
    if (gorjeta != null) {
      salarioAtendente += gorjeta;
    }
    return salarioAtendente;
  }

  double distribuirGorjeta(atendentes, Gorjeta gorjeta) {
    int qtdAtendentes = atendentes.length;
    double? valorGorjeta = gorjeta?.valor;
    double valorPorAtendente = valorGorjeta! / qtdAtendentes;
    double valorRecebidoPorAtendente = 0.0;
    if (valorGorjeta != null && valorGorjeta != 0.0) {
      valorRecebidoPorAtendente += valorPorAtendente;
    }
    return valorRecebidoPorAtendente;
  }

  // Avaliação

  bool avaliacaoExiste(Avaliacao avaliacao) {
    if (avaliacao.estrelas > 0 && avaliacao.estrelas != null) {
      return true;
    }
    return false;
  }

  bool gorjetaAvaliacaoAtendente(String avaliacaoAtendente, String gorjetaAtendente) {
    if (avaliacaoAtendente == gorjetaAtendente) {
      return true;
    }
    return false;
  }
}

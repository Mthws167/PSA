import 'package:contador_gorjeta/entidade/atendente_fixo.dart';
import 'package:contador_gorjeta/entidade/atendente_temporario.dart';
import 'package:flutter/material.dart';

import '../entidade/atendente.dart';
import '../entidade/cliente.dart';

class Controle {
  // Gorjeta
  void gorjetaExiste(gorjeta) {
    return gorjeta;
  }

  double gorjetaAtendente(gorjeta, salarioAtendente) {
    if (gorjeta != null) {
      salarioAtendente += gorjeta;
    }
    return salarioAtendente;
  }

  double distribuirGorjeta(atendentes, cliente) {
    int qtdAtendentes = atendentes.length;
    double? valorGorjeta = cliente.gorjeta?.valor;
    double valorPorAtendente = valorGorjeta! / qtdAtendentes;
    double valorRecebidoPorAtendente = 0.0;
    if (valorGorjeta != null && valorGorjeta != 0.0) {
      valorRecebidoPorAtendente += valorPorAtendente;
    }
    return valorRecebidoPorAtendente;
  }

  // Avaliação

  void avaliacaoExiste(avaliacao) {
    return avaliacao;
  }

  bool gorjetaAvaliacaoAtendente(avaliacaoAtendente, gorjetaAtendente) {
    if (avaliacaoAtendente == gorjetaAtendente) {
      return true;
    }
    return false;
  }
}

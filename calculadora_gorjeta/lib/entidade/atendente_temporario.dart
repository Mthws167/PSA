import 'package:contador_gorjeta/entidade/atendente.dart';

import 'atendente_fixo.dart';

class AtendenteTemporario extends Atendente {

  AtendenteTemporario({required super.nome, required super.salario});

  bool atendenteTemporario(AtendenteTemporario atendenteTemporario) {
    if (atendenteTemporario == AtendenteFixo) {
      return false;
    }
    return true;
  }

}
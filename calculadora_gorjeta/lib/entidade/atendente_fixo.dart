import 'atendente.dart';
import 'atendente_temporario.dart';

class AtendenteFixo extends Atendente {

  AtendenteFixo({required super.nome, required super.salario});

   bool atendenteFixo(AtendenteFixo atendenteFixo) {
    if (atendenteFixo == AtendenteTemporario) {
      return false;
    }
    return true;
  }

}
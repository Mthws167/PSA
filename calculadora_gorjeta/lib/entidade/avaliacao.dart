import 'atendente.dart';

class Avaliacao{
  final String nome = "Estrelas";
  final int estrelas;
  final Atendente? atendente;

  Avaliacao({required  this.atendente, required this.estrelas});

  String avaliacaoPorEstrela(avaliacao) {
    return avaliacao;
  }

  int avaliacaoMinima(avaliacao) {
    if (avaliacao <= 0) avaliacao = 0;

    return avaliacao;
  }

  int avaliacaoMaxima(avaliacao) {
    if (avaliacao >= 5) avaliacao = 5;

    return avaliacao;
  }

}
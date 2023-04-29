import 'atendente.dart';

class Avaliacao{
  final String nome = "Estrelas";
  final int estrelas;
  final Atendente? atendente;

  Avaliacao({required  this.atendente, required this.estrelas});

  String avaliacaoPorEstrela( String avaliacaoNome) {
    return avaliacaoNome;
  }

  int avaliacaoMinima(int avaliacao) {
    if (avaliacao <= 0) avaliacao = 0;

    return avaliacao;
  }

  int avaliacaoMaxima( int avaliacao) {
    if (avaliacao >= 5) avaliacao = 5;

    return avaliacao;
  }

}
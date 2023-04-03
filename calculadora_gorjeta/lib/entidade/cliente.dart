import 'gorjeta.dart';
import 'avaliacao.dart';

class Cliente {

  final String nome;
  final Gorjeta? gorjeta;
  final Avaliacao? avaliacao;

  Cliente({required this.nome, required this.avaliacao, required this.gorjeta});
}
class AvaliacaoControlador {
  String avaliacaoPorEstrela(String avaliacao) {
    return avaliacao;
  }

  int avaliacaoMinima(int avaliacao) {
    if (avaliacao <= 0) avaliacao = 0;

    return avaliacao;
  }

  int avaliacaoMaxima(int avaliacao) {
    if (avaliacao >= 5) avaliacao = 5;

    return avaliacao;
  }

  int avaliacaoExiste(int avaliacao) {
    return avaliacao;
  }

  bool gorjetaAvaliacaoAtendente(int avaliacaoAtendente, double gorjetaAtendente) {
    if (avaliacaoAtendente == gorjetaAtendente) {
      return true;
    }
    return false;
  }
}

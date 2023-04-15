import '../entidade/atendente.dart';
import '../entidade/cliente.dart';

class GorjetaControlador {
  double gorjetaNegativa(double gorjeta) {
    if (gorjeta < 0) gorjeta = 0.0;
    return gorjeta;
  }

  double gorjetaMinima(double gorjeta) {
    var valorConta = 10;
    var porcentagemGorjeta = (gorjeta * 100) / valorConta;

    gorjeta = porcentagemGorjeta;

    if (porcentagemGorjeta < 5.0) gorjeta = 0.0;

    return gorjeta;
  }

  double gorjetaMaxima(double gorjeta) {
    var valorConta = 10;
    var porcentagemGorjeta = (gorjeta * 100) / valorConta;

    gorjeta = porcentagemGorjeta;

    if (porcentagemGorjeta > 30.0) gorjeta = 30.0;

    return gorjeta;
  }

  double gorjetaExiste(double gorjeta) {
    return gorjeta;
  }

  double gorjetaAtendente(double gorjeta, double salarioAtendente) {
    if (gorjeta != null) {
      salarioAtendente += gorjeta;
    }
    return salarioAtendente;
  }

  double distribuirGorjeta(List<Atendente> atendentes, Cliente cliente) {
    int qtdAtendentes = atendentes.length;
    double? valorGorjeta = cliente.gorjeta?.valor;
    double valorPorAtendente = valorGorjeta! / qtdAtendentes;
    double valorRecebidoPorAtendente = 0.0;
    if (valorGorjeta != null && valorGorjeta != 0.0) {
      valorRecebidoPorAtendente += valorPorAtendente;
    }
    return valorRecebidoPorAtendente;
  }
}

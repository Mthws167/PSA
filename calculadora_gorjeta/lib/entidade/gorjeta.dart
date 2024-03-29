import 'atendente.dart';

class Gorjeta {
  
  final double valor;
  final Atendente? atendente;

  Gorjeta({required this.atendente, required this.valor});

  
  double gorjetaNegativa(double gorjeta) {
    if (gorjeta < 0) gorjeta = 0.0;
    return gorjeta;
  }

  //Encapsulamento
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
}

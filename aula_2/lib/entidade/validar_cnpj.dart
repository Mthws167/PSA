class ValidarCPF {
  bool ehVazio(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio!');
    return true;
  }

  bool tamanhoCorreto(String cpf) {
    if (cpf.length != 14)
      throw Exception('CPF não pode ter menos de 14 caracteres!');
    return true;
  }

  bool formatoCorreto(String cpf) {
    var regExp = RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}');
    if (!regExp.hasMatch(cpf))
      throw Exception('CPF deve possuir formatação válida!');
    return true;
  }

  List<int> gerarListaNumero(String cpfCompleto) {
    ehVazio(cpfCompleto);
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfSemDigito = cpfSemMascara.substring(0, 9);
    List<String> listaCaracteres = cpfSemDigito.split('');
    List<int> listaNumeroCpf =
        listaCaracteres.map<int>((elemento) => int.parse(elemento)).toList();
    return listaNumeroCpf;
  }

  int primeiroDigito(String cpf) {
    var cpfListaNumeros = gerarListaNumero(cpf);
    var peso = 10;
    var digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    return digitoCalculado;
  }

  int segundoDigito(String cpf) {
    var primeiroDigitos = primeiroDigito(cpf);

    var cpfListaNumeros = gerarListaNumero(cpf);
    cpfListaNumeros.add(primeiroDigitos);

    var peso = 11;
    var digitoCalculado = 0;
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 10) digitoCalculado = 0;
    return digitoCalculado;
  }

  String validarDigitos(String cpf) {
    var primeiroDigitos = primeiroDigito(cpf);
    var segundoDigitos = segundoDigito(cpf);
    return primeiroDigitos.toString() + segundoDigitos.toString();
  }

  bool naoPossuiNumerosIguais(String cpf) {
    var cpfListaNumeros = gerarListaNumero(cpf);
    var numerosIguais = true;
    for (var i = 1; i < cpfListaNumeros.length; i++) {
      var elementoAnterior = cpfListaNumeros[i - 1];
      var elementoAtual = cpfListaNumeros[i];
      if (elementoAnterior != elementoAtual) {
        numerosIguais = false;
        break;
      }
    }
    if (numerosIguais) return false;
    return numerosIguais;
  }
}

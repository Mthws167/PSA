class ValidarCNPJ {
  bool ehVazio(String cnpj) {
    if (cnpj.isEmpty) throw Exception('CNPJ não pode ser vazio!');
    return true;
  }

  bool tamanhoCorreto(String cnpj) {
    if (cnpj.length != 18)
      throw Exception('CNPJ não pode ter menos de 18 caracteres!');
    return true;
  }

  bool formatoCorreto(String cnpj) {
    var regExp = RegExp(r'\d{2}\.\d{3}\.\d{3}\/\0001\-\d{2}');
    if (!regExp.hasMatch(cnpj))
      throw Exception('CNPJ deve possuir formatação válida!');
    return true;
  }

  List<int> gerarListaNumero(String cnpjCompleto) {
    ehVazio(cnpjCompleto);
    var cnpjSemMascara = cnpjCompleto
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('-', '');
    var cnpjSemDigito = cnpjSemMascara.substring(0, 12);
    List<String> listaCaracteres = cnpjSemDigito.split('');
    List<int> listaNumeroCnpj =
        listaCaracteres.map<int>((elemento) => int.parse(elemento)).toList();
    return listaNumeroCnpj;
  }

  int primeiroDigito(String cnpj) {
    var cnpjListaNumeros = gerarListaNumero(cnpj);
    var peso = 5;
    var digitoCalculado = 0;
    for (var n in cnpjListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
      if (peso == 1) {
        peso = 9;
      }
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    return digitoCalculado;
  }

  int segundoDigito(String cnpj) {
    var primeiroDigitos = primeiroDigito(cnpj);

    var cnpjListaNumeros = gerarListaNumero(cnpj);
    cnpjListaNumeros.add(primeiroDigitos);

    var peso = 6;
    var digitoCalculado = 0;
    for (var n in cnpjListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
      if (peso == 1) {
        peso = 9;
      }
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 10) digitoCalculado = 0;
    return digitoCalculado;
  }

  String validarDigitos(String cnpj) {
    var primeiroDigitos = primeiroDigito(cnpj);
    var segundoDigitos = segundoDigito(cnpj);
    return primeiroDigitos.toString() + segundoDigitos.toString();
  }

  bool naoPossuiNumerosIguais(String cnpj) {
    var cnpjListaNumeros = gerarListaNumero(cnpj);
    var numerosIguais = true;
    for (var i = 1; i < cnpjListaNumeros.length; i++) {
      var elementoAnterior = cnpjListaNumeros[i - 1];
      var elementoAtual = cnpjListaNumeros[i];
      if (elementoAnterior != elementoAtual) {
        numerosIguais = false;
        break;
      }
    }

    if (numerosIguais) return false;
    return numerosIguais;
  }
}

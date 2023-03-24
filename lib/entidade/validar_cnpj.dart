class ValidadorCNPJ {
  bool ehVazio(String cnpj) {
    if (cnpj.isEmpty) throw Exception("CNPJ não pode ser vazio");
    return true;
  }

  bool ehTamanhoCorreto(String cnpj) {
    if (cnpj.length != 18) throw Exception("CNPJ deve possuir 14 caracteres");
    return true;
  }

  bool ehFormatoCorreto(String cpf) {
    var regExp = RegExp(r'\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}');
    if (!regExp.hasMatch(cpf))
      throw Exception("CNPJ deve possuir formato ##.###.###/####-##");
    return true;
  }

  List<int> gerarListaNumero(String cnpj) {
    cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');
    List<int> digitos = cnpj.split('').map((e) => int.parse(e)).toList();
    return digitos;
  }

  int calcularPrimeiroDigito(String cnpj) {
    List<int> digitos = gerarListaNumero(cnpj);
    var primeiroDigito = digitos[12];
    int digitoCalculado = 0;
    int peso = 2;
    for (int i = 11; i >= 0; i--) {
      digitoCalculado += digitos[i] * peso;
      peso = peso == 9 ? 2 : peso + 1;
    }
    int verificadorPrimeiroDigito =
        (digitoCalculado % 11) < 2 ? 0 : 11 - (digitoCalculado % 11);
    return verificadorPrimeiroDigito;
  }

  int calcularSegundoDigito(String cnpj) {
    List<int> digitos = gerarListaNumero(cnpj);
    var primeiroDigito = digitos[12];
    int digitoCalculado = 0;
    int peso = 2;
    for (int i = 12; i >= 0; i--) {
      digitoCalculado += digitos[i] * peso;
      peso = peso == 9 ? 2 : peso + 1;
    }
    int verificadorSegundoDigito =
        (digitoCalculado % 11) < 2 ? 0 : 11 - (digitoCalculado % 11);
    return verificadorSegundoDigito;
  }

  int validarDigitosInformados(String cnpj) {
    var primeiroDigito = calcularPrimeiroDigito(cnpj).toString();
    var segundoDigito = calcularSegundoDigito(cnpj).toString();
    var digitosJuntos = int.parse(primeiroDigito + segundoDigito);
    return digitosJuntos;
  }
}

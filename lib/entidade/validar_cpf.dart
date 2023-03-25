class ValidadorCPF {
  ValidadorCPF(){
    
  }

  ValidadorCPF.comCPF(CPF){
    ehVazio(CPF);
    ehTamanhoCorreto(CPF);
    ehFormatoCorreto(CPF);
    gerarListaNumero(CPF);
    calcularPrimeiroDigito(CPF);
    calcularSegundoDigito(CPF);
    validarDigitosInformados(CPF);
    ehTodosDigitosIguais(CPF);
  }

  bool ehVazio(String cpf) {
    if (cpf.isEmpty) throw Exception("CPF não pode ser vazio");
    return true;
  }

  bool ehTamanhoCorreto(String cpf) {
    if (cpf.length != 14) throw Exception("CPF deve possuir 14 caracteres");
    return true;
  }

  bool ehFormatoCorreto(String cpf) {
    var regExp = RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}');
    if (!regExp.hasMatch(cpf))
      throw Exception("CPF deve possuir formato ###.###.###-##");
    return true;
  }

  List<int> gerarListaNumero(String cpfCompleto) {
    ehVazio(cpfCompleto);
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfSemDigito = cpfSemMascara.substring(0, 9);
    List<String> listaCaracteres = cpfSemDigito.split('');
    List<int> listaNumeros =
        listaCaracteres.map<int>((e) => int.parse(e)).toList();
    return listaNumeros;
  }

  int calcularPrimeiroDigito(String cpf) {
    ehVazio(cpf);
    var digitoCalculado = 0;
    var peso = 10;
    List<int> cpfListaNumeros = gerarListaNumero(cpf);
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    return digitoCalculado;
  }

  int calcularSegundoDigito(String cpf) {
    ehVazio(cpf);
    var digitoCalculado = 0;
    var peso = 11;
    List<int> cpfListaNumeros = gerarListaNumero(cpf);
    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    return digitoCalculado;
  }

  int validarDigitosInformados(String cpf) {
    var primeiroDigito = calcularPrimeiroDigito(cpf).toString();
    var segundoDigito = calcularSegundoDigito(cpf).toString();
    var digitosJuntos = int.parse(primeiroDigito + segundoDigito);
    return digitosJuntos;
  }

  ehTodosDigitosIguais(String cpf) {
    ehVazio(cpf);
    List<int> cpfListaNumeros = gerarListaNumero(cpf);
    var ehNumerosIguais = true;
    for (var i = 1; i < cpfListaNumeros.length; i++) {
      var elementoAnterior = cpfListaNumeros[i - 1];
      var elementoAtual = cpfListaNumeros[i];
      if (elementoAnterior != elementoAtual) {
        ehNumerosIguais = false;
        break;
      }
    }
    return ehNumerosIguais;
  }
}

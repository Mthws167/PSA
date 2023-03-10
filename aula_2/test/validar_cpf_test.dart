import 'package:aula_2/entidade/validar_cpf.dart';
import 'package:flutter_test/flutter_test.dart';

/**
1 - Escreva o teste antes
2 - Não escreva mais código do que o necessário
3 - Não escreva mais testes antes de codificar

 */

void main() {
  test('CPF vazio deve gerar excessão', () {
    String cpf = '';
    var validarCPF = ValidarCPF();
    expect(() => validarCPF.ehVazio(cpf), throwsException);
  });

  test('CPF com menos de 14 caracteres deve gerar excessão', () {
    String cpf = '111.111.111';
    var validarCPF = ValidarCPF();
    expect(() => validarCPF.tamanhoCorreto(cpf), throwsException);
  });

  test('CPF com não possui formato correto', () {
    String cpf = '111.111.11111';
    var validarCPF = ValidarCPF();
    expect(() => validarCPF.formatoCorreto(cpf), throwsException);
  });

  test('CPF sem formatação possui 9 dígitos', () {
    String cpf = '111.111.111-11';
    var validarCPF = ValidarCPF();
    List<int> listaNumeroCpf = validarCPF.gerarListaNumero(cpf);
    expect(listaNumeroCpf.length, 9);
    cpf = '111';
  });

  test('Primeiro dígito do CPF correto', () {
    String cpf = '108.741.389-30';
    var validarCPF = ValidarCPF();
    expect(validarCPF.primeiroDigito(cpf), 3);
  });

  test('Segundo dígito do CPF correto', () {
    String cpf = '108.741.389-30';
    var validarCPF = ValidarCPF();
    expect(validarCPF.segundoDigito(cpf), 0);
  });

  test('Dois dígitos do CPF corretos', () {
    String cpf = '108.741.389-30';
    var validarCPF = ValidarCPF();
    expect(validarCPF.validarDigitos(cpf), '30');
  });

  test('CPF não possui números iguais', () {
    String cpf = '108.741.389-30';
    var validarCPF = ValidarCPF();
    expect(validarCPF.naoPossuiNumerosIguais(cpf), false);
  });
}

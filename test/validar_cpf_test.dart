/*
1 - escreva o teste antes
2 - não escreva mais código do que o necessário
3 - não escreva mais testes antes de codificar
*/

import 'dart:math';

import 'package:aula_16_02/entidade/validar_cpf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Não pode ser vazio", () {
    String cpf = '';
    var validarCPF = ValidadorCPF();
    expect(() => validarCPF.ehVazio(cpf), throwsException);
  });

  test("CPF deve ter 14 caracteres", () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.ehTamanhoCorreto(cpf), true);
    cpf = '111';
    expect(() => validarCPF.ehTamanhoCorreto(cpf), throwsException);
  });

  test("Deve possuir formato correto", () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.ehFormatoCorreto(cpf), true);
    cpf = '111';
    expect(() => validarCPF.ehFormatoCorreto(cpf), throwsException);
  });

  test("CPF sem máscara e sem dígito deve possuir 9 caracteres", () {
    String cpf = '111.111.111-11';
    var validarCPF = ValidadorCPF();
    List<int> listaNumeroCpf = validarCPF.gerarListaNumero(cpf);
    expect(listaNumeroCpf.length, 9);
    cpf = '111';
  });

  test('Primeiro dígito calculado corretamente', () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.calcularPrimeiroDigito(cpf), 5);
  });

  test('Segundo dígito calculado corretamente', () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.calcularSegundoDigito(cpf), 0);
  });

  test('Dígitos informados corretamente', () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.validarDigitosInformados(cpf), 50);
  });

  test('CPF não pode possuir todos os dígitos iguais', () {
    String cpf = '124.968.929-50';
    var validarCPF = ValidadorCPF();
    expect(validarCPF.ehTodosDigitosIguais(cpf), false);
  });

  /*
  +--------------------Regras do Clean Code----------------------------+
  | Use nomes significativos                                           |
  | Evite funções com mais de 2 parâmetros                             |
  | Executar testes limpos                                             |
  | Não quebre a indentação                                            |
  | Desconstruir problemas em menores                                  |
  | Comente apenas o necessário                                        |
  | Tratamento de erros                                                | 
  +-------------------------------FIM----------------------------------+
  */
}

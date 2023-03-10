import 'package:aula_2/entidade/validar_cnpj.dart';
import 'package:flutter_test/flutter_test.dart';

/**
1 - Escreva o teste antes
2 - Não escreva mais código do que o necessário
3 - Não escreva mais testes antes de codificar

 */

void main() {
  test('CNPJ vazio deve gerar excessão', () {
    String cnpj = '';
    var validarCNPJ = ValidarCNPJ();
    expect(() => validarCNPJ.ehVazio(cnpj), throwsException);
  });

  test('CNPJ com menos de 18 caracteres deve gerar excessão', () {
    String cnpj = '07.943.476/000105';
    var validarCNPJ = ValidarCNPJ();
    expect(() => validarCNPJ.tamanhoCorreto(cnpj), throwsException);
  });

  test('CNPJ com não possui formato correto', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    expect(() => validarCNPJ.formatoCorreto(cnpj), throwsException);
  });

  test('CNPJ sem formatação possui 12 dígitos', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    List<int> listaNumeroCnpj = validarCNPJ.gerarListaNumero(cnpj);
    expect(listaNumeroCnpj.length, 12);
  });

  test('Primeiro dígito do CNPJ correto', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    expect(validarCNPJ.primeiroDigito(cnpj), 0);
  });

  test('Segundo dígito do CNPJ correto', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    expect(validarCNPJ.segundoDigito(cnpj), 5);
  });

  test('Dois dígitos do CNPJ corretos', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    expect(validarCNPJ.validarDigitos(cnpj), '05');
  });

  test('CNPJ não possui números iguais', () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidarCNPJ();
    expect(validarCNPJ.naoPossuiNumerosIguais(cnpj), false);
  });
}

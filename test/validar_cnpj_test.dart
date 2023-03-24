import 'package:aula_16_02/entidade/validar_cnpj.dart';
import 'package:aula_16_02/view/pagina_cnpj.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Não pode ser vazio", () {
    String cnpj = '';
    var validarcnpj = ValidadorCNPJ();
    expect(() => validarcnpj.ehVazio(cnpj), throwsException);
  });

  test("cnpj deve ter 18 caracteres", () {
    String cnpj = '07.943.476/0001-05';
    var validarCNPJ = ValidadorCNPJ();
    expect(validarCNPJ.ehTamanhoCorreto(cnpj), true);
    cnpj = '111';
    expect(() => validarCNPJ.ehTamanhoCorreto(cnpj), throwsException);
  });

  test("Deve possuir formato correto", () {
    String cnpj = '07.943.476/0001-05';
    var validarcnpj = ValidadorCNPJ();
    expect(validarcnpj.ehFormatoCorreto(cnpj), true);
    cnpj = '111';
    expect(() => validarcnpj.ehFormatoCorreto(cnpj), throwsException);
  });

  test("cnpj sem máscara e sem dígito deve possuir 9 caracteres", () {
    String cnpj = '07.943.476/0001-05';
    var validarcnpj = ValidadorCNPJ();
    List<int> listaNumerocnpj = validarcnpj.gerarListaNumero(cnpj);
    expect(listaNumerocnpj.length, 14);
  });

  test('Primeiro dígito calculado corretamente', () {
    String cnpj = '07.943.476/0001-05';
    var validarcnpj = ValidadorCNPJ();
    expect(validarcnpj.calcularPrimeiroDigito(cnpj), 0);
  });

  test('Segundo dígito calculado corretamente', () {
    String cnpj = '07.943.476/0001-05';
    var validarcnpj = ValidadorCNPJ();
    expect(validarcnpj.calcularSegundoDigito(cnpj), 5);
  });

  test('Dígitos informados corretamente', () {
    String cnpj = '07.943.476/0001-05';
    var validarcnpj = ValidadorCNPJ();
    expect(validarcnpj.validarDigitosInformados(cnpj), 05);
  });
}

import 'package:flutter_test/flutter_test.dart';

/**
1 - Escreva o teste antes
2 - Não escreva mais código do que o necessário
3 - Não escreva mais testes antes de codificar

 */

void main(){
  test(
    'CPF vazio deve gerar excessão',
    (){
      String cpf = '';
      var validarCPF = ValidarCPF();
      expect(()=> validarCPF.ehVazio(cpf), throwsException);
    }
  );

  test(
    'CPF com menos de 14 caracteres deve gerar excessão',
    (){
      String cpf = '111.111.111';
      var validarCPF = ValidarCPF();
      expect(()=> validarCPF.tamanhoCorreto(cpf), throwsException);
    }
  );

}